Return-Path: <linux-arm-msm+bounces-108174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KpMOvDzCmpZ+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:11:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB5D56B4E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6C933066317
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680B3F20E9;
	Mon, 18 May 2026 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmxrNzsi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2ECIGOx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D2355F25
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102393; cv=none; b=Lo+QRJDX4+WpUiQsWYL3FTNH2m7cjs/7p6b/Lss/RTu1ig5FXlcj+Gc46UShqKbgtJCyXacKDTX9WgcJlZx9LMAZ3C3JjHfCBFLKedj18vDSDixR7pw8piltuSep9SvAst5XVKDlKk5CcYqf3x9ks11LbX1maiv58PZvMvkCBIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102393; c=relaxed/simple;
	bh=CpUYG6vS3S+Zh4vlEXo3mC+63dtXNGF7YJZd8O0qHUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDTg7V/OKgOk02sVffZNZdntJHcnF5LZpu5UWCogbBRzhqo/F/CDdWCgIm+W1qMwVfeUdBHC0C2T0117wJ4JSInXIyqwwCZfycB/JJn4KgHzk7d4zfF0mzRfVFYgPpa5c8A0QtWmMUts6mSs3ktzvvLGHrftsMWjEBSAJoWu52E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmxrNzsi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A2ECIGOx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IB0QHF1696718
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oxxEq02mQW5EXX7GWmzdPFvm
	pta8PWyHWKrV/zZVHTM=; b=PmxrNzsiVWBqg7AOYPAHkkBkMDVhcHaOhNF+EAr1
	7BU+zZSac8lCxz8GYzEUcsXFfS9fDo28XQ61gAcip/faPEzekKrxiKFwuKY9byVX
	bMCHvw+wqZwssIcew5vV8/evEL5/Y9E4kD9BAzcxp85e4aVPzF4KRxEiNP5TaBe4
	1p9XtEXqPrOp891WhmqZNbu9o5mDrZ1VU0Jz1Wx6sWZCrEBB6fGKnL/k4xr3RXrb
	zpb6m6SwYQ77rAUJa7gMimBaTReSYnzr7mHtXd+k/1LtU6qyKzTg+ocbgK+rt7Ex
	3PQPRANHzt7yjXS1+xyFR8FccHChzduCVLxaex7mvLABDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vsk1ddr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:06:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baedd2fd43so16019985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779102387; x=1779707187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oxxEq02mQW5EXX7GWmzdPFvmpta8PWyHWKrV/zZVHTM=;
        b=A2ECIGOx+tUTHrYwpex/0UKFqVS6Uy/Voz5KMXCD+YYOIti7cNCIwfypmGt9LMJhUx
         dfuaShznah7lUCmfS13kZ5uzg2LsXgrfD7GmzqFTkEP1yXZApQ+ANqvR33/Y7AZFcxQC
         6LfMx+t0br1JIi8VOKaWZ4T8QVJYwtXB326nYOHLHYK9DPiwkRwfe1bWNxldbEXVyuVg
         vxK7TGX4i2EHvVqWrAxoC8fvr97X/8ydcgiEyccVe745S1R02IXmvRI4mL/LMy/L9ZWV
         aJJdr+le3rFtHNEZHklV1lx/wiNHDG8rK3eQTLbnhVfmfbt6Xvjo/ma6Oxuv2+Wqle0+
         ClSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102387; x=1779707187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxxEq02mQW5EXX7GWmzdPFvmpta8PWyHWKrV/zZVHTM=;
        b=BZuTiNIXVH7u9GiHEA+KXJ5zcRxKBZaV7Yir5FKfNdBAkIYAlaATojmI/dnwZ4v0Q6
         PHqJt6nh8Xp7RM5dlXMc0xObbjP4kwwG6kXURwcx1ylslFlqUqttZIUdivkk2jS+EMbV
         U0mI+vR3IGOeMG3bDmKK8dVHvD6UuqtY9mt4eS/FqN79Y/iCrCQJXHAIzTxadV50PgTx
         HCZJuQPX1IzCv5hbiTq24n4VYz7er9hXCSFJ5g5PJ/I/ohxFMqYhT509lJIvxCjDZq21
         4ER5j5MKIhdF6DjKMGRqWjPaaLfwr9NHZcDHno8siFfPIB5ScVGADrdGxIbJ7Lh8R2HP
         M7+g==
X-Forwarded-Encrypted: i=1; AFNElJ/od2FTFs6/jAUjlZNxGX6H5mtl6BT5n9639lu1KysmzoQTZpvXvV08G0KMPbMmX1nC9NFacj50FJI0Jvgx@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXO0bHCD+k7OhZJ4nL6EXHpRevSeRiRYWyz7vHbiLhLLXgkpk
	fhhb3zhrbfauwMJFRB5Ubzn7d5FzAdS/C/v4aQeD4eurMowQxNqAL9HRZCJ52KcQ7/eNgzGG7Fd
	YcyMvaSADoMFnHEaDNwX0V9k+VwYe+u/VDyG70wXcGtBTuuT0u0O/SR+nAmzRrxlR+u5g
X-Gm-Gg: Acq92OEVd7yHdmi6XTyF6dO8kh2pEb8nNycZg2Jk/398wzqoQBM4bd6wGXc9c89PPEo
	T6uGkiS9Ff7vTO7wNV11DunhEYYvI6FjeFwEZC4BxidB7qAfzNYHKLEQEF1mjzMk9J9NM2FhHt/
	Jfse0o5xlyXHOjiFfxCLXjz2337DAHm4iwAG1oxBl1XhJpKoV14SH2+8dZw2dqdq2NhDffE+nYe
	gra4Lls72yEu7L74VewcH6pLCyb5nMXOBt0AnxoA75gsWhP63CaHkRwQNEZotT+cldP3LMeEHeG
	EAGoRkmB807crAz19Ip+diZn5UvM1LajFuz0jNVPnHvvfJTNQ6pU56/gHAeLzFB6sdV8Fokma2d
	ZAB4wzrKDy/EzSGZpczLMqnUdvNNO5ykgKU3S2X1Wy5mR6EQA5COKKBX0M+0=
X-Received: by 2002:a17:902:da90:b0:2bd:612b:912d with SMTP id d9443c01a7336-2bd7e8ad548mr152759275ad.14.1779102386828;
        Mon, 18 May 2026 04:06:26 -0700 (PDT)
X-Received: by 2002:a17:902:da90:b0:2bd:612b:912d with SMTP id d9443c01a7336-2bd7e8ad548mr152758855ad.14.1779102386228;
        Mon, 18 May 2026 04:06:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm167923825ad.16.2026.05.18.04.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:06:25 -0700 (PDT)
Date: Mon, 18 May 2026 16:36:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xueyao An <xueyao.an@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: dma: qcom,gpi: Document GPI DMA engine for
 Hawi SoC
Message-ID: <20260518110619.su7gh442g3kon6ch@hu-mojha-hyd.qualcomm.com>
References: <20260401124028.589931-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401124028.589931-1-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX2InnQB2685yY
 Or4ycc1lVauRLMz/A2rwvWpAnA0ztlj2uQMgvK9uWpFxyS6hwvdgDQ7MjpZTtecvZEkn5zqGYRq
 2TDrO4KiUjsYrTQxq3YQ7MfhdzfyjKGS0FBNbCzqJ6Tv54oNxgz7BKr/EmS5SypqHskqzTZdARK
 dDjXs26ADhJ/BgYNnUNLO42+JfTAcHRQNOkxXG54bqkq85GJCubkFjczm3bhyaTOvUwfsY7RUPk
 ixDobkRhfCpaK3FxtxGAp39gxnnEn7DGRo6uDFNlNvxSifCpX/PlfQcm3sqrxfE7/u+nDaw+MZT
 tK+USIGmx7y9e9+SUmoIS1hY0Jy2ntwNixZo2QLeAK+t1c7RFW0in/2Uzzm3q3ZIZ1ThFk/A/b7
 Z80pKB8r4fI25oPly8FuilLLDtKsR+Epsq7CQGXjDt4FaVQ2GCb8KfSIHmWadYOjIyOW7LaRteu
 Y/ae3q24T2g4u/hlG+A==
X-Authority-Analysis: v=2.4 cv=Bq+tB4X5 c=1 sm=1 tr=0 ts=6a0af2b4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YxT5vFHApILTLK8CKXUA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: w5Oks6y6AEpPtflGP3pRPkyoduKNYBU_
X-Proofpoint-ORIG-GUID: w5Oks6y6AEpPtflGP3pRPkyoduKNYBU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106
X-Rspamd-Queue-Id: AFB5D56B4E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108174-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Apr 01, 2026 at 06:10:28PM +0530, Mukesh Ojha wrote:
> From: Xueyao An <xueyao.an@oss.qualcomm.com>

Hi Vinod,

> 
> The Hawi GPI DMA engine follows the same programming model and
> register interface as previous generation of Qualcomm SoCs like
> kaanapali, glymur, and is fully compatible with earlier GPI DMA
> implementations.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index fde1df035ad1..caa2ef90d8f2 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -25,6 +25,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-gpi-dma
> +              - qcom,hawi-gpi-dma
>                - qcom,kaanapali-gpi-dma
>                - qcom,milos-gpi-dma
>                - qcom,qcm2290-gpi-dma
> -- 
> 2.53.0
> 

Would you be picking this ?

-- 
-Mukesh Ojha

