Return-Path: <linux-arm-msm+bounces-113631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VCeWKaOXMmoo2gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:48:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0103C699D87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:48:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Sb0rsstT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jJQAtJnv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113631-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113631-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6CFD300E716
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A383EDE6A;
	Wed, 17 Jun 2026 12:48:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C71C27A92D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:48:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700513; cv=pass; b=nPRNcL5fCC6kiUpnuSJZW2LCgd56eEYSDqcFdWN9XMwLtzmH+wV/wwnlnSg2BW/EFuOD9XUwEf0/bRo8Jp8ImPnLOUJsNXsmyiaSEigxkIBqFdfPRMrFYfzmMMwMss6QX8lJUbMs+BQkleIQP7H6M3CpE2uiRq397JIiJo0gmas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700513; c=relaxed/simple;
	bh=1QDlqDAENZKDUJNZlTH6erPxR/tMb1XUANlyY7Q1ycI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XLYBUCHik8r1s6t5ZpIOx5lu6V8UiOH+n/1JiBLVy3ezHAlI192fbk8LLR4p1gIw1T71GGoftI2zx/AxQd2UIbcqW0HuFF2BD6EGStpesD2u7Xnr2SfER7WPRmVY+0gf1gd1RJk5B+muTxNS+iBO60dSh3FVZ+QKy3/o47fiosw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sb0rsstT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jJQAtJnv; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V6v02291351
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZJF6u/a89oyxhTG3HTO28Hbg
	scfu0gN23dEPd4mDnnU=; b=Sb0rsstTnC6r34y5brXEKwpLM+MQYVbvU1Tcysyy
	WpcqkIF+10wTQjYCZNwqCE9Ptmji1wtP3Iy8lTvMJFSJx4td/yVhF1ZmwBeiOcze
	4fEIIZno21U488IWX8Minb5X03wCK/Ru2SE//9/1BlhK0OX5H64xOza9PaZI+9Y4
	6TIPRPhoeLQfhpsZu8tYuNBVqXvPLn6KVsLTcJE64Kl4PpYYR5DJGyYVZo7b6ScI
	U/KV4MAdzq4zgsi2JE4uNudVOoYGM9irMq4ryv9yFmWE9c+SgQuTzJjknJjY10vO
	fL44hN4Po2xiFjL0jjLTWtsas7phV6kuVtqQqFJDj9oI/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevk7b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:48:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8599ebec31so6083899a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781700510; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2IocuJ8xlDUxo5Bhg7dqxDuB4Yh2JYTi/zjoNVKBY5jmrYGhpoVsjextaXf+Bw4Nw
         HGXut+F5stS1SShdvAk/s3vk9xGhhgt6YJi66N+WBObbyGOwSxTqF13iM/VVOyai9SSg
         ALYvk7nHq71OAUx9K9FVdpZnBXIInKxFe1pRUEA7/lm5VF1uYVzyouGuZl9Q9yTK2YC0
         1vVtFFfCjPyBbRXLWFv1dgF3+rhkGLXCqudHVnU49SCJiLqRiRUSFaNByTkQSjuWzlm2
         mbgvwLIzE0okmfQtPl9u+Ap2WMZwzW7+LNzyecodhLrDeIaPrgVjVk7OSZoUmMpLbgqU
         MzYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        fh=n5SOmGKCnu2aQlzOsQroc3/Tgyyb5LWrJeq8zX5oIkk=;
        b=Pz79GqaqL4gqLsIiRBd1ztjmwLi3PH+5/DqFf0H2Fy/KIdpqYjPrBBJC1H/eOzOVDm
         u3sRMo79EFaC8HORdJWnPNoAVrgUO1vWdG0EvMhrT4XBNAreIDkdAFTE8rpJZCAoDwpH
         kFq5elmd/Q7rAPG+ykVJWnBCsQLJxSOpVfBNxJ6Pic2qp3/pQaHhOPOKFBruYuY7Sqla
         LDnsbtvLurRcyqCqFPQiM1exYcKtr6WLdpIyOlWrLMHazmRKLMxe71yt0sBRifrXv2C8
         HQcNgG40oM7zt+utidaOx+TLQ/P9KYZGQxlcDjTTdNYYvejTTbSD2c7KQePxUDg5p0UM
         oGWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781700510; x=1782305310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        b=jJQAtJnvuDABxnuAI1drpJwQFxXdHruETd77QucJfpQua4U85l/KyVfjP58xz1N1zQ
         HgP9QcW+QaCFEw/7ISXxurSQTL3vLY002fZvHP260iMY7kQmQqep2G1FDTfhjb97BWrg
         SU0OncYxKIsrnpbrMmjObiXHmD7XkHHc6FMlE/k7jCzXwTBFEkbLJMrat7JkBZrGh7D6
         VWdhXIIJFohuKueJIcAVGdT/raiHncC460qVSO7ukJzEncOm7/+YHmlJDYFJm7QeapzJ
         WoWvpgDxVzNAXw1U8/m8HpfOApQucIa+rUog7qAEAG6zLhJAfFZsn1nOHRzbmQTzprlv
         rrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700510; x=1782305310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJF6u/a89oyxhTG3HTO28Hbgscfu0gN23dEPd4mDnnU=;
        b=l0RtGJkOk8ee3Q4vNVpt/+bAHzCItP0f9iS3flM7wDbyyFFqyHHapYNYOv+pCNOn2S
         JY5xG85Fy+ARpIN37X7OehGrRxvvNrcSjroFLQARTI0iAWe6yjkW0JsKmBiqAyQFOxFG
         cB2s3CIGDPgN8/5kunyK+LfNDPaNtIVxdnJ6vRwzrIxPfRcyUPcGq5J5DVn2hsNFwekQ
         h//uQ8/JC8kehAjKBKUccgJ7AE/Ry9vrfLTkGBMPj9Cy6m8hCJy/6LHs/DC74E4wRlBe
         mrA2F+Npe9ZzdN9nRYLKvp5kuq9b3C/LZX1sNOwP+Z134+66+BvjOYRfkRCSYCby0vRZ
         YvoA==
X-Forwarded-Encrypted: i=1; AFNElJ/F7se0HD2tuUZuEAECiLCICVSEpVkbcDq5Wb4mAndq2rn11SGUXbRuEgafsObOpwCgZLHNRW7E+VEyCt2X@vger.kernel.org
X-Gm-Message-State: AOJu0YyNlRsRr2Xr2kIz/4DSqiPMZOBKu66ZkxZbNMwrks7bEneuPLPt
	2OJSqNwtdxqdlytJlyMk5maW0eZu3pA2tUxIHyUNCslmLat1hkrNMvqC1X+DapoE9TYMWcnGF/V
	jtCB1bwX01KWwnpl3DGK3uJZRfaV8gGHlpgVxztTzogad/4KZRKF54Z7w1GPA4/+3GGssUNof+g
	bdLs4vcfHI7JKTagrFLTcoISS0nELoD7Tlt000+yOIsyw=
X-Gm-Gg: Acq92OGFLrMLujkzst8CcCLoRS4RplMaq908J4cUx3nprOWpH8S9eNq1ogBeqQaf6ZH
	EOc4vge/OsssfE1JVCY+3YSqDlQDutDqqqbIIlxZsh37dVrGNijd1aE9+uQt9Hf3Gf4KwtmFlBX
	VAgAzVbNOQtwrQ9kKDOzEHv26XDEHBPp3N/bPt/Ah8gmCcLTNUa0CxdYlkZtQVOrRAQormUyNpD
	t2MuFDjrqplUtI1HkqVUanJ9TgFaw==
X-Received: by 2002:a05:6a00:348e:b0:842:7992:bdbc with SMTP id d2e1a72fcca58-84524529a80mr3916377b3a.28.1781700509793;
        Wed, 17 Jun 2026 05:48:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:348e:b0:842:7992:bdbc with SMTP id
 d2e1a72fcca58-84524529a80mr3916330b3a.28.1781700509240; Wed, 17 Jun 2026
 05:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-shikra-dt-v1-3-716438330dd0@oss.qualcomm.com>
 <20260513042836.073F9C2BCB7@smtp.kernel.org> <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com> <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw> <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
In-Reply-To: <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:48:14 +0300
X-Gm-Features: AVVi8Cfcg5pAZuZTe-ugeVW0fqcByYJhAO0tSKWmmXXpUZyQiDgZdXY2-T4O6-4
Message-ID: <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfX+R+fPkszc8WR
 llY4E6MHAoD6bQM+G/iviPRdckqgFnKwgU2xsYUxRRsEPbcsaihMQXTC6hKX7vHOPpNvU66fbVJ
 qySyqE+h0Lywt0alTBl/bwZRBHJ9G9I80NEEzlORngTxg98UIH6lXkp6iRpKS1XRNQerYz0T3uS
 1a8M4Wfe0Cwwvpd/WhFjPN5LnJsucoCtWpBf6RDrTuu9ZzDthseMS10K96p6gDNoYAFSzWSiodL
 1l5eGdrYVMX6lz4HM/NifmsGvmGi6Lyqcc5oxRaAU32zk2yYlk+v9t8PeWknYJiFecGX4USoejy
 DN/vWtPZHjlQ4hQUeavZiM+vL1PGfr/cTZaGR6pR1CY3F4ObyEbwFDMDr9uH4KMCmMa3Od4CNUc
 +U2nVCWB93mwOICzfzlW/0MYh6EA+f5k+kt2zM0uOGWmEqXteJQaGR+6vRJ7aJlM7i1vUT1+Kbm
 yf25tSRNHdN3/kLYK/A==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32979e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=AXN0PHSXbqqaHeSrhoAA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: O6obTWq5PTDibyXKhrK6ieei1dMr9CFo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMSBTYWx0ZWRfX2qRg/+eyiXCF
 q+0CJjrI9DK6WVFGcUVe/WDV5K3ha1RDheUOX/p7S+0korQDWiFRu5Dbx7a07BEWM40mITDsn6U
 gu5KLitfK9VUM8tB9JfNYy9PlVbgNR4=
X-Proofpoint-ORIG-GUID: O6obTWq5PTDibyXKhrK6ieei1dMr9CFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113631-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0103C699D87

On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
<kamal.wadhwa@oss.qualcomm.com> wrote:
>
> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > --
> > > > > > >
> > > > > > > commit 457abf6e7ac410430c866842e08e602ec3daaa51
> > > > > > > Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> > > > > > >
> > > > > > > arm64: dts: qcom: Add Shikra CQM SoM platform
> > > > > > >
> > > > > > > Add device tree include for the CQM variant of the Shikra System-on-Module.
> > > > > > > This variant integrates the Shikra SoC and PM4125 PMIC. The DTSI includes
> > > > > > > the common shikra.dtsi and adds PM4125 PMIC regulator definitions.
> > > > > > >
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > > new file mode 100644
> > > > > > > > index 0000000000000..401e71720519d
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> > > > > > > [ ... ]
> > > > > > > > +&rpm_requests {
> > > > > > > > + regulators {
> > > > > > > > +         compatible = "qcom,rpm-pm2250-regulators";
> > > > > > >
> > > > > > > Since the commit message indicates this is a PM4125 PMIC, should the
> > > > > > > compatible string include a specific identifier for the actual hardware?
> > > > > > >
> > > > > > > Using a specific identifier like "qcom,rpm-pm4125-regulators" alongside
> > > > > > > the fallback allows the kernel to apply specific quirks if PM4125 errata
> > > > > > > are discovered later.
> > > > > >
> > > > > > This can be ignored. The compat is a leftover from the historically
> > > > > > incorrect naming.
> > > > > >
> > > > > > >
> > > > > > > > +
> > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > +         };
> > > > > > >
> > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > such as vdd_s2-supply?
> > > > > > >
> > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > >
> > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > downstream components?
> > > > > >
> > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > >
> > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > votes are cleared.
> > > >
> > > > How is this different from other, previous platforms?
> > >
> > > This is not different. In the previous platforms too this is taken care from the
> > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > may have a RPM/RPMH regulator as a parent.
> > >
> > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > calculated based on the active child rails. This was done for all the
> > > subsystems (including APPS) regulators.
> > >
> > > So no explicit handling from the APPS is required for parent supply.
> >
> > You are explaining the driver behaviour. But the question is about the
> > hardware description. If there is no difference, please add necessary
> > supplies back.
>
> I understand your concern about descibing the parent-child relation in the
> devicetree, and given that we have been almost always followed this for all
> the previous targets, it will expected of us to add them.

Yes.

>
> However, we want to avoid the unnecessary access to the parent from APPS.

Why? What is the reason? Do we want to do the same for all the
platforms? Only for Shikra? Something else?

> At the moment, I do not see a way to avoid that, if we add the parent
> regulators.

That depend on the answer to the previous question. In the end, we can
make the driver ignore the parents by removing them from the regulator
desc.

>
> @Bjorn, @Konrad - can you please also share your suggestion, how we can add
> parent-child desciption, but avoid accessing parent supply from APPS, as its
> Qualcomm's system design to handle this on RPM/RPMH firmware side (you may
> recall we had a verbal/offline discussion about same concern in context of
> RPMH regulators earlier).

That's why offline discussions are bad - you can't include other
participants in them.

-- 
With best wishes
Dmitry

