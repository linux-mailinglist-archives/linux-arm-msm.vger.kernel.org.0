Return-Path: <linux-arm-msm+bounces-73744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A538B59B74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9387C7B5870
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC6C61A315C;
	Tue, 16 Sep 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlyuVcXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAFF2DC79E
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035287; cv=none; b=YfB4a2ywIhoELJpE4tQ+7y4oSt2nuxjHyGRuWH3uBqU5RC2Fll5V2EADyWzKwjCPAlj5HN2bGpULNfxy1Oiezcz1Xxs+kxZZiJ2X0UfzJwXLyqkoeBJDnvEzo7Iq/29oJS5qW2uDCUhd+doisfcZVSglSMurCu5u/KeDF2qgwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035287; c=relaxed/simple;
	bh=+/iokOMthEBqZY0nc3dCTFOtJ9aBIskV8eLPLw7WHO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o470YY1kEIHGyOzIdGX+SBiuejmsoLmCR//6kRhMTCa1hVHNeOdZ3IRfo/0YVvPEMUABMe437ipoDqxZ+vWei9CXWeTiX72J+ewEWUM5HUaquKsfd/YFrQUot1yuRTmYV79u7pXHvyisuv+Gd4t3Rbem8TWMzK1M6fpho57CbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlyuVcXr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAf8B4021231
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MPO+d98w+3iOJ7r1VX7ngwgK
	hIE+yDWZLLAhoG1dbAg=; b=nlyuVcXrJnUzhyRVPM1B6Sphd+3+fE2FQG7VCLXF
	NYYrAzC4DyDkngeC2PxazuxgS5kUV/sJpQRiR/m3oB4DNFXSBxoX2XSsLdeMaWFa
	lCFyRt4SyfsSyoaJyStpK1E9u8n9DtGJNjPhBl/UinzqrQC1UxE1YP/9llNTL6WF
	itkb3xCrZcjvmwJECZQyxDPtluvoXSM7+CXTUiHh5figsW/4YeWQEgL91vkPFVq/
	ITYzGCxBw9OKqI1EhCZ7bQpQNa8OR5KqeyaYD6JGUJHTaRSd7jB5AocqD/oj9bGW
	aTZnb0BxbfpjEdaCzaU6/CBLx2LhDFeoD/YAVha8T4YtuA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494yma99bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:08:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-82119c68f9bso1728717785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758035284; x=1758640084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPO+d98w+3iOJ7r1VX7ngwgKhIE+yDWZLLAhoG1dbAg=;
        b=CVM/JzOLrhBH5LpIJHsylHhDNKbraplO3Jnu0+Y8NervkyghkBTDMAIlTZ4ohCVu6F
         4eRRuREL+hJnF7evU+yaugMu+nMYZinf/eF564Z1FV60UCW4pUZEvmC6c2F4Z4TQ+Mtv
         kER+bNhNo31Qw02RXYr/areaZ0SEEMKEg9L7oaYEePSXIxMCujq3HkLSdYzZuZI1DhG5
         Bjnb2sNjA2S74GsgHZ9TFD+tG2PhcJ0PkxEycAmNF/q/EXdrc40VE6OGgLyHrY7K0PZe
         IvTk5o8hb37KrgBIDSH/EmZszPYu3Zu4NVng0U9oe6OJpjTvXBksyJ3PQ61NMC+cZzR1
         x9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVI9xP/43wTGmyA3aBng9VPgQrib3+DHm5JShgsmLXMhyBbjQo8Sv3bD6cO96mL6ggLfk3QwiYZV10n4tEu@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVz4cawvOdYoqUhP5/ouXZ9Qsp5nzFWL1OTMXixmR6uS4R2Vv
	zQ6/noH+46HKCgjl6SpPIQaTcTUVSMR8vydI+d7hihTm/aKpnDK0VzuVf5JKt9WLD3bJds64Hgb
	phI2GDVNGy5hK7KtAiU+9+qhaeCAvZDQyHykGrkGCHf8hemrx1w3YId0Qui7CmCJqEzZN
X-Gm-Gg: ASbGncspCHFmRzGU1NxoUqmQ3f09g2aVgItWUjiVpSD0hmGvIPv8U+SzAqmZ8+Lm0h/
	HkzL43vOB2ghTsMq/HFJmjtj8Sq0PSllt0QTTQbMHueViiGMCUPXqRx1WL8P4YP12HVO5saLaIk
	OGbqIYtKE2clcJQ82UgrlLHLv+3cTZnHCh9Dq63i/kJGyf0X+BFXIKMaCfa2f+rVMoDab6GreuC
	TlBtuweWWNwk7pwwE5p3xQIryKT9LAY1vJejVcM+1lTPr048nrU3xGRIysnvmigpougm2PrReC9
	eIYf+m+YHfi2gjIfwegmFiqD3PhDUdVYWIVyUvQ9XYcLhBi/t+qf/SJc4SU3ChKNfayBftrm2JF
	WuUAqaWyrF1yRHEUVnvcwzCgh1/iPyV8NtHJwkDhbEzajTxu3QiKB
X-Received: by 2002:a05:622a:1a8b:b0:4b5:781c:883b with SMTP id d75a77b69052e-4b77d111997mr260538831cf.73.1758035283767;
        Tue, 16 Sep 2025 08:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrACAfwl8ZeXemoXPckpMD2j5mK+zZ9+PVxetZdWKuYlRe0KBFSwXVAvO+6fqdZftYcLUzBQ==
X-Received: by 2002:a05:622a:1a8b:b0:4b5:781c:883b with SMTP id d75a77b69052e-4b77d111997mr260537811cf.73.1758035283070;
        Tue, 16 Sep 2025 08:08:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e651919d1sm4559897e87.126.2025.09.16.08.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:08:02 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:08:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH v2 2/4] dt-bindings: rpmh-regulator: Update pmic-id
 property description
Message-ID: <6oyrycnarpfpsguinbxur7bjltpvlhyhowzktetqk52zeabvf4@6fn7pnw7aehh>
References: <20250916-glymur-rpmh-regulator-driver-v2-0-c6593ff9b4be@oss.qualcomm.com>
 <20250916-glymur-rpmh-regulator-driver-v2-2-c6593ff9b4be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-glymur-rpmh-regulator-driver-v2-2-c6593ff9b4be@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOSBTYWx0ZWRfX0p1A8ikQTPm3
 2VspkwfDArQCw9dSrcjXiealy37aUo+eFUIJTBwIqm7YF1pOAJogx8mIPtQnkMmdjCo2iLGj1hs
 oCDwVM8YQt4SpZJqTfWURDfh0DC+WWWM2+hUsfZ7ukAhzsvNyRyXgHSsN0X/zDkXcXi9YeuXKQ0
 PRddXnoDGUeiCTN0CGvk24diDnm5S392YTVTb+mzP/HXFKMjBjwuIj/hdUkXtw3TZWv2lwWRLw0
 3tVkP0cLboFJo88kAVxPXK9f81+N5L9ZyGzFJW9aXuLmJHRTjj9DcdrdCecGO3jbKMmE3pX4zgJ
 l3URunNaSIm/pAaqhMyXGVeVRywv2R0teS0EzIqEzDH/Oo2QJkIQdJ/uDo902zRi/wlsbFTMRhB
 5s4HRiZv
X-Authority-Analysis: v=2.4 cv=cdTSrmDM c=1 sm=1 tr=0 ts=68c97d54 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KtqaayFS73-macfLQeYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hHvxwVRGXZnuqxga85YvMLSY1uz3obc7
X-Proofpoint-GUID: hHvxwVRGXZnuqxga85YvMLSY1uz3obc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130019

On Tue, Sep 16, 2025 at 06:28:53PM +0530, Kamal Wadhwa wrote:
> The `pmic-id` property previously accepted a single lowercase alphabet
> in the range [a-n]. However, on new targets such as Glymur, the
> property uses a new format: `[A-N]_E[0-3]`, where `[A-N]` represents
> the PMIC ID and `[0-3]` represents the BUS ID.

You are sstating that the property uses a different format. Instead you
should write that on these platforms there are multiple SPMI bus in use,
so pmic-id needs to specify both PMIC 'letter' and bus ID. The proposed
format follows the cmd-db format.

> 
> Update the property description to reflect this new pattern format,
> matching the updated driver implementation.
> 
> Note - Old format [a-n] is still valid and will work for existing
> targets.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index 40e57b10ebbebeff130871b6d978df64111b6f29..40ddc64577e78b5c0dbb7b4e8893a08e8b37c92e 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -108,7 +108,7 @@ properties:
>          RPMh resource name suffix used for the regulators found
>          on this PMIC.
>      $ref: /schemas/types.yaml#/definitions/string
> -    enum: [a, b, c, d, e, f, g, h, i, j, k, l, m, n]
> +    pattern: "^[a-n]|[A-N]_E[0-3]+$"
>  
>    qcom,always-wait-for-ack:
>      description: |
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

