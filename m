Return-Path: <linux-arm-msm+bounces-100495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFYmJ3MRx2ntSQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:23:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC6034C42A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 00:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34D333023DC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 23:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66EC737AA92;
	Fri, 27 Mar 2026 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fR5AAmKk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmTbdwrl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E54B341AD6
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774653792; cv=none; b=OxbR7rp6s1ujj8+O4XY5Hymy6y7fOz8VeSwdzYCNGDPMm+8eaV1mv5DQjdplriJmvPMng6th1qXKSdtQbS3ls+mVTLDBurKDFGIO4c2REJTsw0PCueDIDd14lL7qKPblaqJbnkabPtUt17o3/nCDER47Zn+YB/6eutGYYGxcDh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774653792; c=relaxed/simple;
	bh=KKoEVadXmfX+eJOn11MSj9QhT70dAnjq94IVOwZj52g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFZIaQ57jN25g8ewaPrQR+TQP8b/MZsopinAKhLw82rMB3xq5lYRnfShdo/ac5w70gejA3FjDN6hBM7Gej2c6m1/lQb1B+U3kSMlI3Q3vNJ+GXVudxmsU/MtJbAxvMu5CZJ3C1mBwQ00A8so++2Ev6i6oyrFm67Ob7tPBge+lQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fR5AAmKk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmTbdwrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RN440n2410634
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VdliwqcRhp5SljuMOcgQ5BLR
	pJRliwtVYafIt3tKDSc=; b=fR5AAmKkwLOClErr9exH1TTRqZ7F8HZ2FK5PpqF4
	bez41oQIRzjiTx4h0pyu+2eS3whyBoqGe0ZfTYFOFTQMaS8b+rXul6RhwHhqkZ5D
	9NVOX+IlW9lQfj+VTDX8CLVsi6EksEZYuhQrnSjkA6t7QJEV14r8dS3iTRvw7lTr
	XOEKkvK55MjlrTYg0TfOpLhJTSO0wX7RGB45/Qlitqr92PJJdukKS4x5lBvODN0H
	5B+UKxHhS7V0TU5tdDwVHWGwZ4rDQ9/4XyqeMMXTEst371q+MNmvOG1IVtgyU/96
	Bf/2NQM1VZETFMywdFNdfvPQLa03HXnzz7mfQXxH7L4pig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv98h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 23:23:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso27495011cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774653789; x=1775258589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VdliwqcRhp5SljuMOcgQ5BLRpJRliwtVYafIt3tKDSc=;
        b=EmTbdwrl8dTimlpPQGtizrF8l4GLcEfb18LoWlN+ChVxdzEGVuhWzPt901BeVvTNNv
         TewiZo27buCO55pmla/ld96ITxVToAMPdCKf+/j8DuRbYmd/PS6GzWIJ4BXiUFCa3E2S
         pCuBOzMl/gs8UZBA8OJkrFnHuoWFwRuv5wOsiT1QAqe16TpeZqt1hMWmZuheuLZ6ooXW
         IqJXVxfuxazI0V+JcFAglOAtcogPq7MD6m4woqznUYrvS4XPB8kzCRvHbpfgZ7StPlRz
         u1mUJ11Y+wdqksZ406g2gr2mXxqkZ0XiZQxrjpTV4KPTwZneblHxuo+UDf8kv7mD+SnG
         yKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653789; x=1775258589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdliwqcRhp5SljuMOcgQ5BLRpJRliwtVYafIt3tKDSc=;
        b=aePZSkLsWz9zsMjrO8N3oCBiTRpnhJ2CAEdgBJh4wujO+jFFoJRtdt5c34A4UOVg63
         X6MTGoqECQlPmaYG1oG2rlTi8H11hEzflUzHs1EdKWfHSshHE614piYTEZdbV70HhI4y
         d+/01XIS2m+ovfEcs8o8SAEdeOqBk1dhlKXD+AjRhQ2DnomPTp+GFu5eUBUnky6QB744
         X9DrBvwQeZx9yJSKFmEUc4qBgiRdNayWRk0Y3j3f2GwLH6AQbi5bS5MNeM5wSfuyeI/o
         KitgaDVW2QPLv+bqId2Mkb4+y61vB0jGNAJzroTFJUn6oLZ1JRBxD9pLTu2nc0eNTfTf
         agpA==
X-Forwarded-Encrypted: i=1; AJvYcCVO+FOxSmOALvnh5EOCYY4WZwCN0jC3Yl1C0o7g9lNdMuTbR9iiNA53LnxF5tZpaGzWWF7BTTjCYsvesshw@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMKBb1Udw5n/Bnf5GH5ZVDtXj/sOuqtuLyRWkGRB7sJtTI2cW
	qTEl/RkybYIk8wNKYWUYdFrduProXO9O0BULTzgPJeVi1FeTOqspSAsjb1uFIllyR86iCpJJ2YY
	kYYvDFxK7kdTctMFp3KWSh9f0+RmEdPCKawqRotr4h5X/Z7DZ4yCXeQWORn0GEJrS0Q27/2XESF
	8Q
X-Gm-Gg: ATEYQzyRKTlXfgyaCwqXw4COy66k6RDlacmCEYWYRaaF3iFLUNncDFLnUzipNs5J3oy
	AunlOEN16BU7I8ww7amFDlra6jTB1mJdZjNi9MxDOiZhthrAQ63/OvmNU+g6mLkn3q/VBlxmlK9
	6PmtakbEeKK1UDou8C1zHdi6W7gbELYEGXaSgZPyYklrIjsoKyrFcxY1JKvQzLALwrYgM9/s383
	RGCXqP37Izpj0ZeNVbD7CNYkgVKwCBkOGXgJTlFgvCed4zQaEXmifVQXR+oY0t+mc8a9qsco0Lp
	rkRrsQLGL+osAjmN3o2A2uJzMzC48QSq78JuGLtsDFZv76ia4w2SxBg0eCe9CVlbWke/nH/UHdB
	14aa4ZVFXYDYKDxOnrbVR9V2lzsNQRVWSfLU3Tp5pjbB6exFONvvK9AmFFxsxeGtmkJRUEXnruS
	ffzOQtvxdTDUDuVaP30SWzjOIUby0VSqRlTok=
X-Received: by 2002:ac8:5f12:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50ba38bbf67mr62332821cf.43.1774653788737;
        Fri, 27 Mar 2026 16:23:08 -0700 (PDT)
X-Received: by 2002:ac8:5f12:0:b0:50b:6a48:78bc with SMTP id d75a77b69052e-50ba38bbf67mr62332421cf.43.1774653788222;
        Fri, 27 Mar 2026 16:23:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f429fsm83853e87.2.2026.03.27.16.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:23:07 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:23:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <qr6ubhjlzxenx7rswwkfu2nkc7ci5hw5tynpipa76bqsibbd3d@rw5d55vjnkbe>
References: <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <72ef6c9e-feb6-4e57-b8cc-7801bd748698@linaro.org>
 <f1c8c412-1d27-4c83-8c5e-76b9369ea6e9@linaro.org>
 <VwCtoebjwHqLTucsrGruvBpedA4k-Melt7C0DA0aHSVld3PeotwZdtMUm3EFpvQyScrl6yejmLaK7bY1avT1zQ==@protonmail.internalid>
 <8ac55e5f-72ed-4331-bf42-92ccf97507dd@linaro.org>
 <5d7d5bf8-4420-4d75-b928-820bb9233e52@kernel.org>
 <CiKTMNVmEm3LXForJ4o-DjuXFxbKkiaLtqbFPYyA0rC-Ij0hJPmCw_LUixA-dZe2douOwy2Jxizna8qBRvUjPw==@protonmail.internalid>
 <2houacfdkozzk35ky5xtwe3utkvyx4lroyrhvibb5lg6lad2g6@56akvtqigaep>
 <556a6736-472d-4551-b5df-15e809e7e20e@kernel.org>
 <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a44a0f58-11cd-4aa4-962f-a5b153e24d82@linaro.org>
X-Proofpoint-ORIG-GUID: v2IXnvv7NHN350hOcftfMjUI9koEbf9x
X-Proofpoint-GUID: v2IXnvv7NHN350hOcftfMjUI9koEbf9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2NCBTYWx0ZWRfX3WOmdwXv7hu6
 75TbHBun2kisj4f54hW11sM5h7jum3Bp3lNAvwoThUUpTf3Pvo7yuflsq4DPlXWCjBVcwtRLMP/
 P4kYWhvBqk5aLBfnuKf3mP0/EVEbTRdop7jQ55HNP1tHNCH+wdTTjqXRWAyUF3/mTUhulgxH+VE
 rGLc+WdpbgrT0OTPyVuVPWSgl2AuOa7fQPG8FIjhd8a7kfBFvJg6uzwdsGfuRWrTKFkwli2iY5A
 4ra5LKft83b/DAwqUfjgwk0R8yxX1HpddDjpMGf4guI4VDz0sgvfatXPu1Exv+2PyiwvAORl5ex
 o5CtFaoqNNlGfyf+QlfIpy7ZuqLA7ajLGugRJk7y/avsiUh+ndX+PbKAmVY1Xz4BZ7euKpG/DO/
 FJhrOIiw+Zy/EvJ47pWmtkcYlAa6+B+HuwLB8fxBRnDw9Ia70StgngeHZX/vL9tSOBxvI4l3xjq
 lf64qZFpfnc3BZS8FyA==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c7115d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NHJkdllwlKbNI_IFlBcA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270164
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100495-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DC6034C42A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 01:12:22AM +0200, Vladimir Zapolskiy wrote:
> On 3/28/26 00:29, Bryan O'Donoghue wrote:
> > On 27/03/2026 20:51, Dmitry Baryshkov wrote:
> > > > That's just not true. If you read the camx source code you can see
> > > > split/combo mode 2+1 1+1 data/clock mode requires special programming of the
> > > > PHY to support.
> > > This needs to be identified from the data-lanes / clock-lanes topology.
> > > And once you do that, there would be (probably) no difference in the
> > > hardware definition.
> > > 
> > > 
> > > In other words, I'd also ask to drop this mode from the DT. This
> > > infromation can and should be deduced from other, already-defined
> > > properties.
> > 
> > It still needs to be communicated to the PHY from the controller,
> > however that is not a problem I am trying to solve now.
> > 
> > If I can't get consensus for PHY_QCOM_CSI2_MODE_SPLIT_DPHY then so be it.
> > 
> > I'll aim for DPHY only and we can come back to this topic when someone
> > actually tries to enable it.
> > 
> 
> DPHY may be the only supported phy type in the driver, it does not matter
> at this point, however it's totally essential to cover the called by you
> 'split mode' right from the beginning in the renewed device tree binding
> descriptions of CAMSS IPs to progress further.

Okay. How would we describe that there are two sensors connected to the
single PHY anyway? How would it be described with the current bindings?

-- 
With best wishes
Dmitry

