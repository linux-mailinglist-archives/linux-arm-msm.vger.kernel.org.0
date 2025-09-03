Return-Path: <linux-arm-msm+bounces-71781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAEB41A40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21BA75464F0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A6E2E8E16;
	Wed,  3 Sep 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJTt2uvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9621D2BF016
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756892389; cv=none; b=Vklj99fSB1JKP0mWRh+Q23b1RFBpbpe7KCvYgB4BuLZsWWDBF58YQ7Ziv70WozqQiy3k422cbXyp/pVh+xvRNFX6J75RNIr/sIryDvNJezchIkmhMI3kG7TJRTiFLW2i0SwPNq8LVQ9rD+JfxWYiqyuL8+1Pub2algWdw2Ylj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756892389; c=relaxed/simple;
	bh=Iod6MVqSTEvTZBDL2mvodsSb964W4mjOh9p5Hpm6SDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfVg0jAz2/EVhBI/p/PlFT1ICXhBGF3ua8EsHrHpkqPmLOp8P5VIakY5LOmv0uwTD12YRhGQ8oDjAB4VozUcNRkTHESnRTMc4Uc/A5dPW+zs3ZGXel+062Gh483F+wbSGpBiyhXooLDwfBrO5HHu2no19o8r/mpjzbIC5+YbqCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJTt2uvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832GknV010163
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PnA1zrsRSyNw0gMpmXgq+WAu
	GqVrfq31mjMEHuIgNIs=; b=cJTt2uvlRhcLEXPM50l2Nn1iHr+jDECvtViTFnZf
	UGu+lRvLDRrZWQoQI9v/YU3qR0UtoofPamSPNvmZq7hrUqAPunqKTQSzrMaJzfW0
	PlQ5lMQdE9XAmVrgfXZCtqFker+/f7kGTYOBeK8kx+DJhbuL3XKYxKbWdleTdCtP
	vbYK+SyOklxkLHFpMi/OZ126Apr6olaG9MrZIJKWDaF+d0TK0Kt3G2zHZskOXHpu
	rVN2LbjTGH++paxBTKcuDOiW0TYHaXtlZfW63T7F7oRBdRZ/08t4CStSOwM4MeEq
	m0glasTpCw+2/MPZtFWellcbpHmLxakH9BUpNyMSaLfwpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ek6yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:39:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32119e6c6so78599561cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756892386; x=1757497186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnA1zrsRSyNw0gMpmXgq+WAuGqVrfq31mjMEHuIgNIs=;
        b=gR+Mud0hXo0giAufjOdnwkIu+NVCge9jregNC7a6qopBHy+5lOWRH4aqpT9GF9g3DT
         j2h/CmaP9EhSk+QtlUmdH/FBlqHV3mYCx5OKkqnilkcT4kuiRDc2Ja0TiD14qFyX5BZ5
         +A8YIj8yB8lbpKwhBamyiQKz/GrjL8hrTSFqGtubtAXV6S0S6zzW8dVN1kSf+IrDuh/S
         ipqOy+cJ92Nwr5K792O//TBFKzuEJpC1wzifv1TRysF3Nslwz7RNbzM6CEIRN2e+4mNP
         bBEFhPpaoDrTAh5N7ge3sQO+lNAMe+pQVpsZ3QrQT99LgaNP5jmtST74NAerChgbcQ1q
         fzQg==
X-Forwarded-Encrypted: i=1; AJvYcCUgctdVLIInOr6roOOcAMmf/BSHL21FPxkP+rw44dy4U1kyrvDCvNdk7W1OrVYSwohntAYKwq6cRTnNCRM5@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5BOIYuyLcMi1q27JwaKOrzKA2/ejktTmETW8ULesk0MZX+EA
	3iO0pRugiHKlLLwYqJnVRsFXQpOpcXF0nV17cL7XoK4V46a3m7/qaoOljP4SRRLvNQ0aRJgKmmu
	R3MiaXkNZR2+2M2OppWcU9ZoAbbCYW62DxJxPA36rc3uS8aielKNiQAcoG2dJikXq8YCX
X-Gm-Gg: ASbGncuM5cA13fDDcY6ePZXdpWtxnI+DIPPaktvmJJ0906IpxZjF48MRsdvgErXgxDo
	/OKq2c9jcKSWE4uSdvnB4ci6V5HPmw1GphZHPcjCzGU+tnnMNs36rx8X0fpVL3mtGE2yfLtlIq2
	IhkFmzgLmEri5vazP3WJX+VTyZ0zg97sF7f2tsnb/hX4djwZ9hwJAR140BChtd6LSm8oUwTxfo+
	01v0SxdhcdyyzCcTOYmbxGVOJSBnppyMzjJS0dc7IqPCenQRp7Tcg+dGgqoK+OKh3bv1E7jEE9Q
	B1c7Zy5T88sqGTvFzkGXxxlmiQar1KmtcaFAzj5ilO0cgb4F635cgrJMqb/vX0eMyhSCnAhAe0u
	4f+vj4wAwb/nwVmE+/Cu7DvNzexGG35GcnBGy4+ERwJL3cYbC1TT4
X-Received: by 2002:ac8:5d87:0:b0:4a9:c2e1:89c4 with SMTP id d75a77b69052e-4b31da3d038mr175175231cf.47.1756892386356;
        Wed, 03 Sep 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8btfB/NeOOnX7chjqs01CjROAGySEXXXx2uoY7nlmZ3PqyzGxeauLl8pu/1CkaS6/4jaPqA==
X-Received: by 2002:ac8:5d87:0:b0:4a9:c2e1:89c4 with SMTP id d75a77b69052e-4b31da3d038mr175175011cf.47.1756892385878;
        Wed, 03 Sep 2025 02:39:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad5027esm397058e87.149.2025.09.03.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 02:39:45 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:39:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 12/13] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <xcq25wmw7roelcmoljypn3ozt7kqvylgibz2cloxghaeurcwvs@jjay7hton6md>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-12-2c7a85089db8@linaro.org>
X-Proofpoint-GUID: h-EGpHjW-hDoR_VJ-xtEfcn--elrVuUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX+HnjKhPbf1uT
 ur6bvKV5Ov9eF7BBxUGzbIhP9n21LcxiDKBM85Yvs3FGiNLMJ+oRBAEMqRh5LGICZL3/oWJDddn
 w0OSIKXOwIucbKAU0VEt8WjqwWSa1zHCeCXX0mpPqVfb0hVkwNe9lzzzAm3fU2Yt3HUsoNpLLt6
 oEhsm3iIsS+2LOquzYdfE6xVnb4CPmxFVUbre6YNbNAgtsb6H3E8J0ZvGbdxxSq/olHgZKOiltq
 u69Ng1i7rbanM9FA3NM+2sA5N5tmOJ++Ni0Z4F+1sBS7/dVJUDZJybVqf1OtEs3xW5y5JF8CkNp
 umHjxA3Mf16ego1+JYPS7Fx6iGaqQRBW6+Xrkgj344XJLdrUl6Yh2GvbiSKRcfnN7zZdL5j/XwA
 RfUrOecu
X-Proofpoint-ORIG-GUID: h-EGpHjW-hDoR_VJ-xtEfcn--elrVuUH
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b80ce3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=sWKEhP36mHoA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8
 a=n0UrGh5Us5r51zfKeZkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Tue, Aug 19, 2025 at 09:31:06AM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen is futher handled by two
> pipes if its width exceeds a limit for a single pipe.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I've run several CI workloads. This is the first commit which breaks IGT
tests. See https://gitlab.freedesktop.org/drm/msm/-/pipelines/1503075

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++++++++++++++---------
>  3 files changed, 110 insertions(+), 40 deletions(-)

-- 
With best wishes
Dmitry

