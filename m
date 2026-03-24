Return-Path: <linux-arm-msm+bounces-99614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KErwCzhrwmlScwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:45:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E0B306A47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8303130EAE95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767763E3DA0;
	Tue, 24 Mar 2026 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncx6ADOr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLpkGrBL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3B37BE93
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348762; cv=none; b=VAd+B/a24ExttXGETOu92WI8QNRzqhyfi7TkRHooUXm5A7xEH/4S9SHWQmPI9Uly1+z3Gx2LuDLoZTFDEMiI5xGfTD4ciajoi8TwAQAtlKxcgrZV67kGdEzXHKGQVJY/fpzu4z/Ujlg7Bet6WJUZUwUqON5KnhtEUe/xjGia+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348762; c=relaxed/simple;
	bh=aixy/4nOGtVTADyTkPYzo4GgfdqV1G72q2wVa/sm6ZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyU8pcCzCHtGrnZXbEgdKloFFRMCeMtiFxxXxnOc3FX+XJndYoPdVM5ZI148cP5XbpIlTO804XF0wkTUmrdOrd+ulh6+wSj7xAYv3KoY1OOpWYlFOSMjKswwo8HJtPQ+coYkmWdcp8U/FXtnWKs+5OygA62e7T+K0+E5HNwY3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncx6ADOr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLpkGrBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OAF6iU3903891
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uj5qYX8FhfQc2+1CHGK1yl39nh7ddqgU8t5AUa3/6Rc=; b=ncx6ADOr+KwUM7yI
	769Cw/e6gqp0AtD4FjBfrfcy+ogQg3dmuA+2FfDTeL2P1L5F5W5jzU2WP+nxHeTS
	GxzENAL/7mtjsP7lUfry9BGJ7qERXd9o2+1EsB4yPDTwoMjwE+CxHMcHbdbwv09S
	2LpHS91tNZiXYVY/ZtG3vipFit7aH+aOXb4eAUxeRPlORcoHS5nhTsKCtY2nTnae
	Ask54iUCBYGs3Z5Mkcnrj8j7oNlcrWmtqb5iwjDFy2AQlHgcoCYcdPiGlcYwcW/+
	4s3R+Wf9jQFeIWOP0PlijQtSz/MZUdUokCIsE0W2EptAZIzcjkuIUdZFY53e3uUf
	njloWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0hfm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:39:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b060c14ccbso132700995ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348757; x=1774953557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uj5qYX8FhfQc2+1CHGK1yl39nh7ddqgU8t5AUa3/6Rc=;
        b=XLpkGrBLfN52GP0hjTk/mMOAZEF+996DGKKu9ormubxK/fClLPoRvhguymZVvJfItc
         zFmSwRQyoAioglPjvImS69ERvwx7ei/4VeP7hcgxoxv6U5IaDDKSm48/8CphrsrPjSdP
         UUKwIDRmfEOrbE9ijfEv7mMAdogWw7lpu6cuMZ8zs+d2pLWi9yYLHohu6I1PvlEDJr9/
         1MSR0R5WXRO3YtKkcwwTrdFGES+sdgjG7IwG8SXaUXBetKbW6Czoqr5hkpJEL1lvYekb
         oOypvYwqQmAf5BnUZEUS0OBEJanrvhOfGMCiPTaRG6WPi2cPRH1GBwZBRs2+EJlHvKJz
         jNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348757; x=1774953557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uj5qYX8FhfQc2+1CHGK1yl39nh7ddqgU8t5AUa3/6Rc=;
        b=gLZauKCbEM+BOvraGh9XEBxGXavw5dEQ7tIXVwizXIoxXtGtTll82OnHZYte0ZhF6n
         6V0m8kHz8QjYBWF7DYBnmti8ovODI5KJzOJO71r58ulh77QX5uCXbL1UmMsCac2xm2Dc
         Uh5WF5Ul3+lE1OSQtlEqOSa9moGSdKk3ZWjaIxZwiuuwu/59WLikfjR3KqVFT8MXYjlO
         jbm6d0BjJ9Tz4NBCJB1fPpACLOGN69JUYnX5rDrIvtFIPLr+CBh8c95fiahbEiu6JCUf
         62ac2pdfIjuhZfwAUeC09JQrsFTHEseu+XLWuEOAxNJLbJjkI6rypvGqczIdS+OE66Bg
         yk4w==
X-Forwarded-Encrypted: i=1; AJvYcCUgTCgv5Q415vb4u476oEN3yN+f01dO3pihfZ5CNVBsjJsRzET4Ba2smcCNq3+0kKKElV2Brd22LZQcdWVL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjv8pb4fyP+5EZOyhrMn7O6X2qpM/x5yKdlVJZ/C45wWU7nrmg
	UhBH9c5z2O6oZ8pPidGEIHCvh/0G4oHzJHrnfrcw9+eNKpHysY6rDEUSY9x/dG4HF0IeTeR2GU5
	+G/p+4FNKSmJ91k/TprN0GNPynYAXX465Lzc0Q7p2YnhDywMsg/x00QaldqfSmPc2x3fH
X-Gm-Gg: ATEYQzxc46MIlae+aVi4jIfyDa8LbkBpTC7yfoFCsFeCyNSP86uuBgWPRBlu1l+NJ52
	O8/nYPdt8BgbvTp5jpbZRe3OZI3+GfezVTBvVqhMrtXPjENzzwh8IuDLqfeecNmYrT7sZsH3wxG
	2AphruC5bfzIJ7ltF1Is0Gjm+zQiW4yYJwP9eepKQoo/1RCS1FNtgsclbrDxEm9VSzUzb2b8hr7
	ea6l+/Mat8it77KDoKjT70qtYoqx0ZbTfigWc7C4buCTUA8AHW6MGLG6qkHIN/bwEbGUzlsamz2
	bzmBcsUMvKNkN1nXFilVSm7PqBSF4XjRrIPcRSaZg2AJlSrU/fe8VAvAmgxMdYR1vunjYjgksDV
	Wt9WrZ6mZoINDCfL8mIrkXeDV1Zlex0lRqc2XJc4Kl98ULa1TIalO
X-Received: by 2002:a17:903:41ce:b0:2ae:508e:5019 with SMTP id d9443c01a7336-2b08271fb32mr146163495ad.20.1774348756695;
        Tue, 24 Mar 2026 03:39:16 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2ae:508e:5019 with SMTP id d9443c01a7336-2b08271fb32mr146163185ad.20.1774348756210;
        Tue, 24 Mar 2026 03:39:16 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083527f90sm137972405ad.19.2026.03.24.03.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:39:15 -0700 (PDT)
Message-ID: <00a59d9b-cda7-406d-a53f-33ccf1ee4817@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:09:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/11] arm64: dts: qcom: sm8550: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-9-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-9-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hKjd-IJ98g3ODIiPm0U29CBmKv-z24cK
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c269d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hKjd-IJ98g3ODIiPm0U29CBmKv-z24cK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfX5AQUWcjEriID
 rsAspGXfuPlSIDeYF2x8UuGv8P92Xk1l5h/53E6FQqic+PEORe3cShDgxY6lvrLaNoINIrzaA/2
 8xeSk73M7Y8iKzaNPpFT02J3y5pTIXXErLyl70Cogw8A98hZn6gGUnfdMFI1KDZgQc90rf9yw84
 bNWANAHqblRXOOKYkorh4h1/H9c9H++Aw0Nj69yKVcMz4xZ1bW4jEao6hwgtpqnyraEEaWIEo6P
 +Irk0F71p1nublLljAyqFHnuBf9CClfYuC5tCkPpwlvrt7tdT0F9VcCOOkPO1CH368yhiB1y9q+
 uR9Fidju2bswar8BRzM75qy8JRl6UH4H0qM+ZuMNRVth+jcoEj7vgwTy2HzWSKC3A8JJE25CwFw
 plj/RlRTbB3uw50EFk2OQQ1fUmzUWNwgF0GOQaArzBHnut4Hk6H3KieupasGSrL5mWw260MSPjK
 pNtPn8lEje4dbx/tUBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99614-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2E0B306A47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8550.
> 
> Fixes: b8630c48b43fc ("arm64: dts: qcom: sm8550: Add the Inline Crypto Engine node")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


