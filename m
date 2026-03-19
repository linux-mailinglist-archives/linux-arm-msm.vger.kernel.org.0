Return-Path: <linux-arm-msm+bounces-98777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELNkI4QQvGkirwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:04:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EC62CD5C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 370A7304AD0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA833E1D17;
	Thu, 19 Mar 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="puBqtNqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJwNi1C1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973611F37D3
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932575; cv=none; b=BQMaVLgNAWCcgUcYmpARJCm08HIX1EulBQq7JPk2k4hsgL9a5GmtsOapzCoCmiu2Bhvcb5ECLT5AAn0ILbF+uS21MB8SefvMR8uEXeB+Nyjg/2d47Q6s5blVauLN53c4WGUPnEiLIF4rK1hiTRY3S4FdM/vqyWu8+IptwUVzQP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932575; c=relaxed/simple;
	bh=EJgCFwzzuRDEE08aQQ5ySdAsqiVdvTdeLOF9ywbB6dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDmh7zozH0DNayu7HPv1MBZmekSNrtd3ThhPhKw+D5WhtBIanh2LtjBjj3uGLWPLr4nRlUqc82U9Ug560YQ7I+uRBhfL5YF4Np8+3aB27GdVHyAOiONFwm6lIjeuH2q1t9FfisyiU69qamycPDA67wvFpmi3UIbH/ZLUJ+m1j0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=puBqtNqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJwNi1C1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEW45J2981410
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gw0O0xNwYmcS0I3X5swyVCTf
	JZqlqS+Tg/Mp4oBMnNc=; b=puBqtNqk5saMSijL3fFa169BCDfTWL8pc4F00abk
	ND+mjJgcM5o8opqz/NRyd+oQ2je8XcaozsKruy3TAZ0a0PtXSutWU1RCawLQbKjs
	ibWWNM4/Po7StttWqzP5RpR1gYILZ/DmtxfURoweYyE0mKbxsYwwNmDnTrn/Tht2
	aL2nF/kCYDDB7WJ0Edn2QNINRTFHCAe+QOmql7n3PlUQ7Q35L1y7Qz/KvnLGLXAM
	ZgeFEaD3iXPnmTYchm9/e4BE+NU0gIY9gMv5POaYq04ezK6/cgxJ9J28GWFbtCEm
	lvLbkk+MwgNBBGNHvB7ZyFd8grdb3ZyeR2CK32fVBBIsKQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0803gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:02:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffa389eba3so1605334137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773932573; x=1774537373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw0O0xNwYmcS0I3X5swyVCTfJZqlqS+Tg/Mp4oBMnNc=;
        b=BJwNi1C1EgrorgFbnxWn0Hxg4uSzuaMD8lc2RKbYR3vy4SPLeJHS/0Ej9d+AddhXkI
         ZOUmI0ky7j8GRC6X7BOp+cJkBG5gspElvX9N2qtzIZdFuyPNaGjJKli5i9QIq4hnb665
         5c33P98IBLH6EBB7XV5oVVV8I3NTqt2j0yJbsMw3xgwPVZoNlKG2GuySQlz4sAqSfOHB
         e6nYy4x/bYMYjkcLy4MvtI5owl/jdpnujQ/FG5qqqLIVfQjwkss9EN7jYV0zL1IFk10N
         L9vKIiSMkin22qRjJiY/Xs8H42OSwYphMs5K4EY54AdOvJNJ3t//d/WM181Qm7bpKsx/
         7kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773932573; x=1774537373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gw0O0xNwYmcS0I3X5swyVCTfJZqlqS+Tg/Mp4oBMnNc=;
        b=hkcT2kEjUi6OgBoVLE5BOD2lS6ilNUjo+qepkzWscBnnHakEyw3Bun54YMoRuw+sQH
         sMsPUffa9l7l+ksScW995Xb0LzdGh4Qe8Vxdni6GyeRbx/1hotb1GaqUNTIforqzZl+p
         cI95x3MXSAwxXf3Wwd20Npv9vD4O6fsPvfyph9VtPCeNyN3gWbW0BFBL4YqBUcUmIa8o
         /cG+7fzt04/ee0XsFvr76k5d/J20WQlLQWdbsHrKQ59J8q0YbWAW5IAwbde6X3A5S33F
         rGpq06FMlNcIglBKjipuswA0LDj6VZ2PzosbEfiw6Puu9a959TsTcmZGBvoW4tDe3BL+
         MBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGE1qjWMcGYUGmBpcS9gJ2cw/mJxCZ/VHF8L0r2IYw4kuutIlmBjldGgimEtalSGSMfTWOoCYrT6MKoL+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4p9Tygeb7ttdubMfjIv28nhvAqQ4XlRQJWfrl4A76MQZWRdHk
	Vl3z9ttgs67cg5qS/jUWvcnU5EE9naCwjrU7gPAOwmSPr0sH2iVfoDg8GC4fiUWTWVkI4Wdq97T
	o7hlqQGckiIfY6/5LttAHkfemR7IMDdKsyWWgAuu9XEWvGCZyvBThaOt3vILYLU0YhyWx
X-Gm-Gg: ATEYQzzKwMoa3Nk+Hd1QW/b8MIumOt849OKAq3Dc+JSe/I2TZonv4+IC/q3vrttCUMn
	Sj2uUHkNEQHOpkSboD0dlazUDY9q2F6X3DYU04mzPhwDpK9aqqQNcC1Wvbw0FIV1jWbXKGi8TGK
	1D+AuueR44uvanWpMFrZ6WQFyhxNN8EL1Sm/aomk0RwBVkPfGQ3PxVpCPnzuJlnu0Hwz0C+z/6E
	Nccc463x3aOHYgqu2lEWApR/KeXRqXFGtkpe6v+lJl+6agFyLvm1DQcAhDhdkLGxGwanNqOXNZY
	RfF6DzmBpFIHahf16nUB840RBYvjzgX/OL4tIXDNcGcA6UtSjkFEgmp41bFNWky1E4MDW/UUXzl
	TpX90jYN6CYNNlXiiEdsmpF+obPQ6mBfOtA==
X-Received: by 2002:a67:fc89:0:b0:5ff:eae7:bd5d with SMTP id ada2fe7eead31-6027d32d7d1mr2551535137.22.1773932572585;
        Thu, 19 Mar 2026 08:02:52 -0700 (PDT)
X-Received: by 2002:a67:fc89:0:b0:5ff:eae7:bd5d with SMTP id ada2fe7eead31-6027d32d7d1mr2551487137.22.1773932571897;
        Thu, 19 Mar 2026 08:02:51 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bbcd78sm42603145e9.26.2026.03.19.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:02:50 -0700 (PDT)
Date: Thu, 19 Mar 2026 17:02:48 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v5 0/2] arm64: dts: qcom: glymur: Enable SoC-wise display
 and eDP panel on CRD
Message-ID: <r5cscr3pjefm56lbbrnqn5ezkmayppjxujynhb7ta66nqo5hdx@nvhhi33e3ayo>
References: <20260319-dts-qcom-glymur-crd-add-edp-v5-0-5fc47061660c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319-dts-qcom-glymur-crd-add-edp-v5-0-5fc47061660c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MYhhep/f c=1 sm=1 tr=0 ts=69bc101d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ZuDrUWSDC_O3N_bgdaEA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: i2cbR4zCOIhI1cKY9qziA_Ir7SEmbnaC
X-Proofpoint-GUID: i2cbR4zCOIhI1cKY9qziA_Ir7SEmbnaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExOSBTYWx0ZWRfX175tj6IflvKX
 oef8S2OfYCA8/Kn4mVhEvQN0RAsCKNnXR6tUg4FOvc3Qprwen+4dcm4GPweqk9f7gUYQHNOV0jU
 EDX2O4awqCP4rlsV/IuXDa92yvPBmbg9NpjRLe8UwulwckNVsZasVLH79jUsPbJf2SVnG/z75/W
 jXrCHtdqNSS7+xnPlv4hfNOCOz0L+0Gw2PNHwlHsB1TH2QjMxECrbEXS5Z8OrSaDfOPJ7ANgdjd
 f3zEvJ+HH9dWk2UGtx7gsJk+CTSOSSAEP8adX8Gmk3o/MggyDt3HD9BR0/rdGJj0eq3v1/AnxTy
 mPKC9N/MCZ3WkaU7ukXMDznuWT6QObtLYvjvui9Kzu0c42qOJdUFyLCv7+Umfe8wiExKKpu/bys
 +/0vx4ExbQaKjn31lCcH1gLOba2K2hCuS96DXm7HHJ/d0gbEWdkyclAoqLvaCFDsxMu2+0RSnaS
 4hGRDgHYk/qlELEgWLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190119
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98777-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8EC62CD5C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-19 15:12:44, Abel Vesa wrote:
> Start by describing the MDSS (Mobile Display SubSystem), the MDP
> (Mobile Display Processor) and the 4 DisplayPort controllers it brings,
> then describe the PHY used for eDP and tie up the PHY provided clocks
> to the Display clock controller.
> 
> Do all this in order to enable the eDP panel the CRD comes with.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes in v5:
> - Rebased on next-20260318.
> - Dropped all dependencies, except the USB DT patchset.
> - Reworded the commmit messages to be more cleaner.
> - Link to v4: https://patch.msgid.link/20260309-dts-qcom-glymur-crd-add-edp-v4-0-fe4e33acdfb6@oss.qualcomm.com
> 
> Changes in v4:
> - Dropped the RFT as now this is tested by me.
> - Dropped the 192 MHz OPP from the mdss_dp0_opp_table entirely,
>   as suggested by Dmitry in a discussion off-list.
> - Picked up Konrad's R-b tags.
> - Link to v3: https://patch.msgid.link/20260303-dts-qcom-glymur-crd-add-edp-v3-0-4d1ffcb1d9f6@oss.qualcomm.com
> 
> Changes in v3:
> - Fixed opp table according to Konrad's suggestion.
> - Added missing reg regions for all DP controllers, as Konrad suggested.
> - Fixed all sizes of the reg ranges.
> - Replaced all 0s with 0x0 in all reg ranges.
> - Added missing clock name entry reported by Dmitry. 
> - Link to v2: https://patch.msgid.link/20260113-dts-qcom-glymur-crd-add-edp-v2-0-8026af65ecbb@oss.qualcomm.com
> 
> Changes in v2:
> - Add missing PIXEL1 clock to DPs [0-2]
> - Use the same opp table for all DPs and drop the dedicated ones.
> - Drop the extra compatible from DP1.
> - Changed compatible for the panel to samsung,atna60cl08, as that is the
>   actual model.
> - Link to v1: https://patch.msgid.link/20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org
> 
> ---
> Abel Vesa (2):
>       arm64: dts: qcom: glymur: Describe display-related nodes
>       arm64: dts: qcom: glymur-crd: Enable eDP display support
> 
>  arch/arm64/boot/dts/qcom/glymur-crd.dts |  71 +++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 466 +++++++++++++++++++++++++++++++-
>  2 files changed, 529 insertions(+), 8 deletions(-)
> ---
> base-commit: 54526d6c29ce58d5399cd4e2237d631266ebaaef
> change-id: 20260109-dts-qcom-glymur-crd-add-edp-03f0adde9750
> prerequisite-change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c:v5
> prerequisite-patch-id: df42484b224c01014637ec5a8f56bab459890557
> prerequisite-patch-id: 7ec5f802a334d96421d8f95d4d9e9773655cc947
> prerequisite-patch-id: 8d9e016b49979fa817cf9eab70b809fdb9d4656f

Still wrong deps. Need to respin.

Ignore this version.

