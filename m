Return-Path: <linux-arm-msm+bounces-65274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091CB0793F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 17:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25918189C92A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3082027510F;
	Wed, 16 Jul 2025 15:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RR+mmuEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B4D263F4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752678349; cv=none; b=N2RqQZbXV1nDl+j52jHqsACo+hus0vrIZ43dMVAiHzZn4gdj2tPDhOUJr8PQT15vdHIoDGjaoex33jFsH0+kqqT3WpbCOjNg5y2R0MlkG8tzW+NWDKDQuVDxK1CKvro72qR71gJUPqtCNYqO9/i0oqTAgvEjY8xuC5QbUg1uu3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752678349; c=relaxed/simple;
	bh=95w6sP0+FjuUfliHxwFbWeg38I0fErD/c2V5092cCqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwvD+lpkHD+deMwaHtCWN8aSp6pOVAKkAs2t90GJFbaon0+m7eSt3nDb1XoKEZ6K/rLOhXVyS9n5Aw6yiTksQ4dp4nnbIojMrhCElyKLNor06Pi6Ui3EWz0DRn1QP6TMNViMYl7ttilQkuYOywPlc+BLpzIK8NgnhrZAoX7SzyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RR+mmuEQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GCrUg0014553
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c0YU6WYevdund5tkdGQl5yQ7
	OWFC47cHfSxZE2himRo=; b=RR+mmuEQzniwxLrkWdZWkEJngba+lUUiGn3haPIV
	vTIneCiat6EpBqaSeP4lljKwLY5vu1KLVq1akKgQNUcEnwXzKYSl9zBuVSuwYRzl
	WkOzIxlmjuO8otdIcWnFY9AQbLle9+g/+hhHQtC3zRMCr6Mu508qIbTBhdtRw7gh
	kT+LfEuoI4DHvSHIipdtHRLTuH8+emmgxKu8d0fwk70NZiTRQEyfnFwFuUboC+ag
	4ZwL3G4zompsNNXIL1ehq+uHxO6t1RH3fr4ee5wqvkAXmXke8t2qinDPQs5m/ih0
	U40ReDZ/wRvWrh2ZPW0baojWecqJHaY17YlVOJnV31K1Mw==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyqbef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 15:05:46 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87595d00ca0so659796439f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 08:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678346; x=1753283146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0YU6WYevdund5tkdGQl5yQ7OWFC47cHfSxZE2himRo=;
        b=fZ815E/8aBxidHEBI7dabh50cxmOvMkMgRuODojcEQmb823vfhyEYivjrOOeMWch1N
         m54CNFz9JfkHyC8Fmags1Sq0/32KPgitgkeoEdmg9dhz3rFozvj9WesiXrf3/qiAyXA7
         nztNO5AZ/Vmoe3ZqT417gPs5biKjjgsTpHwW0zdQ1kZ5HeR2BlyD9/aq/dAc4vDERwBi
         FWJPPgl0EN+wcBMA+BpE/uaJYYiRiNV0FeEnobp8irnCyeKGj/0NcMXwTzBH7uzeTypP
         DBkOqrU1P7hjEntv7PuYCb3JDB2JVDPy/HCz0v7yDJxuB393irPnUTYewrkzn3Fl7I9I
         1oBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD9HcsSbg68z5yH/yj/2KLgPjca59IX5ycdYcpslTHUvSUNXhuP7wslKTQl7Id6AC8kDZQRtplTYM1otU6@vger.kernel.org
X-Gm-Message-State: AOJu0YzfBCGYov/KygR+zr4QHYAS96ETDtYKmwVH1HWn56/y4XPbRCI+
	mDxeTywjo4AX6fEQw7ngwL2jq5bpYLP/iUt6ehlX76cp/ziJFk6zaTxlhlEh8qIdmfjBVEPNqEG
	E/y2AYROGrRMGHKfpkSBcnxiR92UD/74Ku3kwu2so5XQfHnc4lt9JM5X4nkF0196bLm9P
X-Gm-Gg: ASbGncvtxhN528N+z23aHwFVtLT0urcVrEmGly/IOaOOOyurXPixupR/IRAfC0K5R3H
	k144xDcAJRYhnZBDdlCBuyTan3tvtcusx3aATQ6BAtAo6n0qIbOArQCeBjoe166A/M3YkG41sAk
	c6sBQpH0zEmbBx7R9i3tvgE+PvrH5u8MHNTC1TGkjC26KJoE9VKP7aBaUuyZnEurCeeJMJIwUvj
	ZKClkGQVKC5p38kmem0IH4KkYyWJrAB5l7sFzcLBv/NkoUjyb79W4VN5wuAU1HEQgw5/4MD5Nrk
	Xrbf4LlVHegkE4Yj8sRtoKmi7ZFdF02OXZFJ7AimmusrZnj1LDx3LFIgCg1GyF1CBAfnthz44dZ
	364giBvFKdf+uERs/iobkLca81+hxrvLLzCFmnVl5fAUkMVv3aQx5
X-Received: by 2002:a05:6e02:2687:b0:3dc:8423:5440 with SMTP id e9e14a558f8ab-3e2821f490amr29394235ab.0.1752678343423;
        Wed, 16 Jul 2025 08:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiQxVLfGJyjdQolHfpUghz4La4xIzw45yLU/Cq1KVO6NC9WigSlhiSYSteODSSlYkMMHWrdQ==
X-Received: by 2002:a05:6e02:2687:b0:3dc:8423:5440 with SMTP id e9e14a558f8ab-3e2821f490amr29393835ab.0.1752678342895;
        Wed, 16 Jul 2025 08:05:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b60f14sm2710525e87.155.2025.07.16.08.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:05:41 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v9 4/5] misc: fastrpc: Cleanup the domain names
Message-ID: <vvojztwx4bus6tpgcj5s2uzy6pfrmoj6msdjmh2kq3ym57e7pz@nxnob4fffyzk>
References: <20250716132836.1008119-1-quic_lxu5@quicinc.com>
 <20250716132836.1008119-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716132836.1008119-5-quic_lxu5@quicinc.com>
X-Proofpoint-ORIG-GUID: EQckY5ByIRHrPLrjHP-z3Hk8nGgEchCl
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6877bfca cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=CtjknkDrmJZAHT7xvMyn:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNiBTYWx0ZWRfX00xXQDNteE+u
 dITaFTr7ZgYiFil82y9/OF+bC4qT4sUPd9T9LpUNxTI7/wnNx3XtPD4l3mIKb9yTS4VUT8gUPLG
 OC7cFGQrWx9U3ogpzXZy90g1ki+oxSy3Ch0tE4qIWtVPFv2N3YZQsMMu5CEZpRUdzpfJfVv4T1b
 GzEKpfXcrqG/ZK2aPEgIsc9IK4iQV3zKePAd7CeJSk8rHCqtj7R+O0bnQMV83bAMbgg4gS4nUKH
 IVtxS6TMnZgYD0+5W2dLUvVomxC7s1zM/pohQoqVUC9OWKonXze8HuSMa7h9MYXYE8pOxZoukVa
 Jo5pBVKi2sCbaQfG1/NICjyUU8SgiRWEogg7xk7SK/ot4yyVMWANS2IzchOuDS5wkcAhrCOly4T
 4HXmUgwcZdfcO+qhsH/k0VxFd2ymv4BRCVlosp7as8dHyb5K8N2g/U4Wey6xnWJO0zJhIaU2
X-Proofpoint-GUID: EQckY5ByIRHrPLrjHP-z3Hk8nGgEchCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160136

On Wed, Jul 16, 2025 at 06:58:35PM +0530, Ling Xu wrote:
> Currently the domain ids are added for each instance of domains, this is
> totally not scalable approach. Clean this mess and create domain ids for
> only domains not its instances.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

