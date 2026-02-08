Return-Path: <linux-arm-msm+bounces-92170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIGOBHwEiWkg1AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:47:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E210A43F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B6130097EC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E09B3451B2;
	Sun,  8 Feb 2026 21:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1tdN//K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSxAmft9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA7341670
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770587257; cv=none; b=oKFodqyTfC9bIgi17rICsJCLJcc+rwPZs0eUDl0tsRUd4GkBax1u9DI20mxV3Glh+kvM3VT7HK2o9yXYY08bJYoz70HMdKg7HYa0Kat4YN8+ikDKneIzItipW9YPm61K7Kr0awaYRRZunXLjngQoUImaW/LgjO9Z4m63qODUbt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770587257; c=relaxed/simple;
	bh=Xteia3xDPBflDUM0Q2BT8DSCKx61CviNIN/pGViwiRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHplc73jKiyegpjsWh8O8Bzr2V59zZo2heY+YgqSrXAfqFoROUMP+clYhL+vyU3JfX41b8mivPUfj7qDujTgcGaKp3KkTWrmgQzxjx7phHphADT49wdWawaJ7HJkdqrj7De0DjBtPJTvhA845aqlp0KUZPOFDe35smm08j0cuvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1tdN//K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSxAmft9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618HTLf7523244
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Feb 2026 21:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AOs0nwj8LTDPZqYI9z0Q0CT1
	xulosXYHvvzIwLb23fI=; b=J1tdN//Kvn7jeVjtKHN/D04PbyUsEHosUljXX8x4
	0B0dg5dnSkKt6M8DPqhCEDUcI160FewN1qESrsXFvL8ZvS1PoyPzrQVU3o+pYgpP
	4An6c3wv4Z0waKv/Cr76CMhPxKrimOSXdO/gadzZSn2wOPtK3uep+Dc7tfu67rmp
	PTfRRMVsgMRw3seR4HOUJN1iR/1TMkFDnggkyPq/YL8W42zB9UbeVEQK7y6Kh2Pu
	+zNm9k0lw0yt6gQCZDsTm5RnsbD1fvrN8PaSNX/ocSSazTfyfNirwEv2O4mUsSa8
	NFyVHUaX1OLdvb2BD15CemA0CdwvBNsPdu3gWyi3r5kFAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xdd2ycp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 21:47:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b4058909so1022264485a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 13:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770587255; x=1771192055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AOs0nwj8LTDPZqYI9z0Q0CT1xulosXYHvvzIwLb23fI=;
        b=dSxAmft9QhskvvztBAGUWSs3d9Md/S39FP7E8jAvJRMWI09A4XddxT9rI4+33auOWw
         jDlCM7pm/QDGJ2tvopndsy558msOgGc/SrBs4x9a0Kxzegjv/LxsfoE94gv1qPz2RI1a
         XCnsep8e3nV1sf1C8d5Pj1OHa97oO0hpkYAiKymduWi/8jWlpTaV4ZYEC7Pa56uF0eD1
         3dSA59TfTI2jXm7/+OB4r47PCSGj2EpguZTNzc2CVNxLWQdkhoet94iAykZUB9jSv27/
         NHfto35iHN4T9dnWQoDW10CEbTxGtC9FL5JhJ+4eUKWodrFthgTiYfOS5SJZxSLImzCU
         MFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770587255; x=1771192055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOs0nwj8LTDPZqYI9z0Q0CT1xulosXYHvvzIwLb23fI=;
        b=fB+2LsDZLJaxtCIMOFv7DaYf1w0J7IKYy8zaaJpZBrRfnB2VlfzrpVwWXKcZA3LAQO
         oKpzAYb9f9OrJhmI8X5+LiU1HGLrYcMTSPjjYemVxvzS/0CRjdNBzxWUQZ8mhdKM1ZaX
         3A/XGJyt1ofwzBZh8KnLAKunQWr7jjJ/eCcdrRxdL+lyIShcVjAnmR3EVfB8vwoVxRb6
         iXz7Tc7J0e/oLpYDqq/svKlxDP5NiJKj1aWNpA/anxsz7Ze7d6OiE4JzgWWBEWIhfobg
         8MQrRpkfUbDhBt6Nex0ZafuPWA93T7fga3MEoavV4gU8M/mwUEGkQBTMCubPGvlbMUpg
         KR9g==
X-Forwarded-Encrypted: i=1; AJvYcCUL6x1pNX8bUo+ZUU6nZUq+6+PHr/rJD+ivE0r1JnY2RUXk96bSDFhqgtmgWXjM/GYNoMxJsx3H/tMhJRdl@vger.kernel.org
X-Gm-Message-State: AOJu0YyTEDfGRRd/HTHDoKWhF/1Gdr2JDQl9NBcAdmaGyF7zqtNjfA4G
	8yQ06MHSmXQHFIT2z3ofzuNElVP21QOKeri8WMUnqVEcclwUeE9FzOqA2uHSqm1COcnSimZaSpx
	AGIlGRb9NvQ5r8p9BbqbtRKLJt9kzuZdI+UFzvTMAtikMTmmznKNJuX5jPlrDE/mwXR1y
X-Gm-Gg: AZuq6aI58jo4kVz1BsTyzWfwStTmcuGxKdWcDXHA+x2qQ45wSaQI93AdxLbu+hi42wD
	HmadaCkAIErQeR2nJvk6k3F9CdW5KAWE67Q6Q9rv4bA9ga7gKjY3/SCdx4evrfwajG9T23VOWFX
	BDNqYHXptWRDrm92ztjHn/1UBfvM/hfjOcxJVZSXCLsP3yaGaeRy/6h63x/71lGIl16Z2k6iq5j
	Sibzx+cXshA68073+J/CcwldfVNHt/a9ZK615kI1K9PgbUEt+Ta7WgddCbXa2hggQTjw97aoSWE
	vcE5DzH638J+7AqgL7kEy/NidgPVOaOMumYD7HNQcdlHLT5SKkmY5Ny+liYd3VOTjoeKOSDGCf4
	XyeJlon3kiSur64Zu9ouPt4hy6bySYkelUipqwTMkkp0EGjTNSgVdKnX/tLDwqb1VrXgExpSnpA
	mllhCf9hBMiyg1CU5ZZrgGhFs=
X-Received: by 2002:a05:620a:4407:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8caf0961f4fmr1329102085a.79.1770587255191;
        Sun, 08 Feb 2026 13:47:35 -0800 (PST)
X-Received: by 2002:a05:620a:4407:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8caf0961f4fmr1329100785a.79.1770587254757;
        Sun, 08 Feb 2026 13:47:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e49964f08sm1390280e87.86.2026.02.08.13.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 13:47:32 -0800 (PST)
Date: Sun, 8 Feb 2026 23:47:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100
 variant
Message-ID: <75glzfxcgnjr52mexcbas3zzm5rykgzuhv3bflui4zrmnvov7w@gmfwegaziikp>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
 <20260208-b4-vivobook-v1-1-3a9b5e153909@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208-b4-vivobook-v1-1-3a9b5e153909@oldschoolsolutions.biz>
X-Proofpoint-GUID: _Bx2mINGq2d9DgBEYnv-txlHRO2wKqwv
X-Proofpoint-ORIG-GUID: _Bx2mINGq2d9DgBEYnv-txlHRO2wKqwv
X-Authority-Analysis: v=2.4 cv=Rdadyltv c=1 sm=1 tr=0 ts=69890477 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=-Yt9tNsTAAAA:8
 a=gxl3bz0cAAAA:8 a=oO66jZH2n4MJNz-BddIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA4MDE4OCBTYWx0ZWRfX2h+yKuurxm+0
 gk6fmo4bjrdiA7yHlAo7mtoxR2Lyv/5afwVgpUhMuZKzNCJ8voyK/S5g32s98YHdxB+zHlZxIvl
 dzeAYYlHlCyvfU0U9AHarc/8EKIv7dpPoNy3rcD/yIrXistKfM5vMtQo7IvUhJer2YUMUCdDXvb
 3j7YhVAczNtO2gs6+sOU35BhBjkFp1BYM08dztGRv3IgCoVywVtNO2inUhVlAz+BRKy4+6QHoxZ
 qx7z5N+S7qqF7Eqs36R2DJmqPjb0RfYdKhliahNeKapTyvrUnAG3oqr5Wz37/DtLGaa3KyUGWVh
 rTYEPyRjEK5ZoaKOKf58wdvtCMAreITQSp17igMjwqj42wfMgUVy3wQp4MOk3eCi7PJKniNO6cZ
 wyGrv9KP6Pu7NA97nQo6WXKvrpspD49uFm5F30L9ayHEHQSe2IdVfCMyvbPYgKM5cL/JLnramek
 6Kf7YSgGuODr6OSlfNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602080188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,hotmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,asus.com:url];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92170-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 737E210A43F
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 10:25:38PM +0100, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.
> Add the Purwa-based variant:
> 
> asus,vivobook-s15-x1p4 compatible to Purwa SoC
> 
> [1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d48c625d3fc42f1a90f76a020753ae4daec8c5ea..5eaeda2c85bdc189d650bba82f173810854f5d1e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1124,6 +1124,7 @@ properties:
>  
>        - items:
>            - enum:
> +              - asus,vivobook-s15-x1p4

Is it really compatible with the ZenBook A14?

>                - asus,zenbook-a14-ux3407qa-lcd
>                - asus,zenbook-a14-ux3407qa-oled
>            - const: asus,zenbook-a14-ux3407qa

-- 
With best wishes
Dmitry

