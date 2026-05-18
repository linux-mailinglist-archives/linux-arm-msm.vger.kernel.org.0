Return-Path: <linux-arm-msm+bounces-108178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GADDEHb7CmqA+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:43:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D756BD10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA1EC30DAEEF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6666C3F58E7;
	Mon, 18 May 2026 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymdn0rOC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gkFAnv5J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFF83F58EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103804; cv=none; b=TnnDURw6F+eGItcxYKTHED3wKHCPK03YL9rahlKg7KIIixYkUVCll/dVhZgpErQmtquWMy+TRyXiJ/rSk9OQp/5rXD22lPo8jCgNQLJlYAygu7n0P+XbjxoDF/a3gofMq7uYbB9UJ2mxZfO4vdsxymKo5xNMuUrXdAZU/9werpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103804; c=relaxed/simple;
	bh=D+JxwENoOUj3iS9Ow5TGib5JfpQ4/E5yu6fQWqjUhSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCClEKP8uFuzs7TO1R9p7qIZU72naijPeIxQunm0Tj32iaJtEdZntcORDiHwPFvPtam58XLwhNazr6IhfaBLMgUONcSHmH7RAU/3++PkTgQ1got5dZ4/IFJr7N+bpULsjeAbkrVkpnwdh7IqFtx9SMs5noLR8NE2QHUY+i8uSmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymdn0rOC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gkFAnv5J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I807P61697510
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G6hjDl458fg1vZmi1jXkcPSC
	R1vUSBiQ5TtnFePeUdc=; b=Ymdn0rOCHG7oKgKuxMp8IZLFMqXGmaMdnTNt9X1l
	MSlEyPIUBdbmL22N1kRTDc1HHWhpBLGSnvVtUr3Gik63yH5Ti3gbtbQTlSuCgZoe
	l473jJhjcM0ZUPvDG3rsLBOpQuP2eRNrHqsNdvd5air7ONkUfy5swWiXsdjjWLnk
	1yrkFGJ0+kA6+Wnj3N+J72qROiX8vtMGsWdA5zhtwh9UK70YmcZS0OSpqGl8EZM+
	pwc27rUbzsJz2cHmcjzYn6bWic2+8qR/ggb7sfyntLuHS7wvUeH+giRqBJiIntTZ
	SyAVV/Cw+75xTgKX/tP/ZK7R/WqsOjNIvLz3G6aJOCy0UQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g67c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:29:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8292a9605aso1055402a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779103796; x=1779708596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6hjDl458fg1vZmi1jXkcPSCR1vUSBiQ5TtnFePeUdc=;
        b=gkFAnv5JihYfb+qTRAoPKBhOEshRsCCY4oYYIwhpE+F9B1uoyX2yDwk0J2TMHA1BYt
         dTpURmQjHd74R4OgOp24ZRKUKEwo205Pq9tGku0jJMqdNrmH3uYl7fXaRIBt+Xa5DP56
         pclO8yNF/sxV3MGbLM4l3EPvtWPc4Hmcealpmmv5QxN7nVDptSQJcFXH13k3h43UMv3F
         KKkluCI3fb1DfpNvJkHLDJfXgoq/fccTPwqszK+bCVCkQO3d4T7u4YNCegK/Pk8MpeVj
         X//B5wtni1z3v9SZef4B6Oqa9pBYulv0vLUQZN8fR7vOf9TFJPTb0hI4U/L4UezKIWTO
         D2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103796; x=1779708596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6hjDl458fg1vZmi1jXkcPSCR1vUSBiQ5TtnFePeUdc=;
        b=nH1vhB8o5g7KSiFK4fdrrKcebx5d+YwoS4Cttu24NiMeAqnBGxz5g/b2+QCv3QFNKJ
         CzcxYoIHZO80D5z/+mUPWPt+q6DL+CBzUzg+4ktll6VQYU7vKcyR64yl0lheObUJdAqc
         NTXOZLjdWSaM3jy2q/pnJZbMMYVzRc6auadyjbh2p1StQRMEWHaFhTR1GIGY9P+6W4bu
         omVY8HsZPVlEaeX5jL5XbLes8SXihFUihTtuph9jevxeHwyrYGvQv6o4QexzzmOmaowC
         A52GD2MyYTPc5lWwBaD0CVPywl/ZaQIttBZSQJ5XjhVnS9bNwINFEUkPCHHMix8jHEkz
         KzpA==
X-Gm-Message-State: AOJu0YwXu553FeDw+AlmWM/RmTeH/aUw3ntuadIiBj8sHBtcJPMrUFY4
	XW8JHrYNtnKJPKcvUlyRGNDme7Q4t0zgq2AEijUNrRvGbq+uZPIwEgB9dAx6RsXfGc6G43OY6zc
	lgomUImniI018JDpDlCFEf8rI6CmNn9THM9sKvx5fB8Ai+SdDlqa5q6zoCOLZLL65zl+8
X-Gm-Gg: Acq92OGhryH824GTzMVm6SOmwev6Fn1nupXp2JzHRYFQMbRxPOM6oZ5pgpP01MjsF0T
	WbgTq6whYF3wIQVElygRum8CfXC9bKPSrKbdMcXxn8sytcEeM+p2ztJ47v0eMnbMO6lwei6PRxW
	6ZQ2CXPdopOCDORdMiUEyx2y8FZvO0iCKWLMCQjqJT/jWy0V75ROWL3WcYEGr/eIO6RrrPB70XJ
	OXQjxx7ihisKobUogppcj4X8yK5Xuz0q4iGv6pSDB7gqOXUFjHQjW+w5tuvyM6iG3vbhYTgrqCN
	RO+50SK20CX9P13pdRjrfL1als4dapXWPcI27Z/F9YxJrKD79qMtTuK26NdEDYlWjoDOPor0EM4
	qY6hvpSmPZMNyvwbnILfVuwICVIS3y55cdll3tn2oWS3Logx6
X-Received: by 2002:a17:902:d512:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd7e86c6a4mr167038105ad.5.1779103795510;
        Mon, 18 May 2026 04:29:55 -0700 (PDT)
X-Received: by 2002:a17:902:d512:b0:2b4:5f96:184d with SMTP id d9443c01a7336-2bd7e86c6a4mr167037715ad.5.1779103794907;
        Mon, 18 May 2026 04:29:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fc2bdsm187835475ad.63.2026.05.18.04.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:29:54 -0700 (PDT)
Date: Mon, 18 May 2026 16:59:49 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interconnect: qcom-bwmon: Add Hawi
 cpu-bwmon compatible
Message-ID: <20260518112949.ui2gfxvkjdmgc6ks@hu-mojha-hyd.qualcomm.com>
References: <20260427182255.3649922-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427182255.3649922-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDExMSBTYWx0ZWRfX6yOeSE0BVMXD
 Avfo1zwJlgdQ6v1vbzbL/sM3JlMIeFm6k+k3ELYdXOeK2r61qjrLpM4hoTx7Dp2Lvn2cAyQ22h1
 wVaZmDIzo0xnNZ77a0HQvt2rmpBOQR++F18ODrKAkJ4STHMNyPZU5jkhMCcWIU/52mFZEULUkSN
 haxwVBt2A4DIeKojSpoKKyaPU90i8vAExi9W3utweETwSRvPtbVX8DDo7SEh/ud3paPrw9g5vz5
 hmBRSlkFMOApzNUZDtCE2Pke945gROwUpgVbLp2mT03D/kyWNtMmn0gIH97ixy2SpNfLhb7OREv
 BgZpE0DqhcOvheyM/B8aUtccwDom+74G9HmxpxIRs2mfxKYt9LVuqJD6ZulISle9C4JT7WEAkZJ
 MUrrUl+1Ah0BIEKIX9KeEdCIjMxwtVUFH8rjhwNXF+PH1G6W8yXP5unhdO7kIJIyyS6eOJ8W6oU
 9YrtvKYnYqltbhlD3rw==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0af834 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=O7OvwgOkGeDt5fK5py0A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: XJmve5_mEDGKXi_LVhspmuO7AHeh6tke
X-Proofpoint-ORIG-GUID: XJmve5_mEDGKXi_LVhspmuO7AHeh6tke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180111
X-Rspamd-Queue-Id: D66D756BD10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-mojha-hyd.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108178-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Georgi,

On Mon, Apr 27, 2026 at 11:52:55PM +0530, Mukesh Ojha wrote:
> Add the Qualcomm Hawi SoC compatible string for the CPU bandwidth
> monitor and there is single instance present globally to monitor
> the traffic from CPU to LLCC.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> index ce79521bb1ef..82b1d94d3010 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
> @@ -26,6 +26,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cpu-bwmon
> +              - qcom,hawi-cpu-bwmon
>                - qcom,kaanapali-cpu-bwmon
>                - qcom,qcm2290-cpu-bwmon
>                - qcom,qcs615-cpu-bwmon
> -- 
> 2.53.0
> 

I am hoping, you would be picking this., let me know.

-- 
-Mukesh Ojha

