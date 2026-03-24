Return-Path: <linux-arm-msm+bounces-99738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHJZM6v9wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:10:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1917B31CB37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82CF2300A8CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 21:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100D13502B8;
	Tue, 24 Mar 2026 21:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izPCDtIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bANgUguL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C430E317143
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386435; cv=none; b=dSIfV94mi97YeNmZj4926CYC7lOJanJaKzspHi11m3MjxrsREPF6G+sYnEB7VqvxEY4Nh8GFw3oFjL8iZ7TnBx7+U8lNFVlKQxv3VTVKogelcoNm5WM4O0IFVUyA/8DHsveyDVFp9RvKHdtA7XUPsmCFxFswDFSRoTzKQuRIJ/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386435; c=relaxed/simple;
	bh=oZ6biQlUavfRiUY19bFiHKy6Eg5T89JdTcDL2vx32nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzyA1WC21w0F3fMb/9AJnzTYAF3zALawXA6tj/b8gm/yFeoivI3DhGxSF4ePb6l/N+Fo1cYZrDIQKRieBglt66uL0burV0bpthbbxIziVRgOb0RIB4MVl6eCWT9BK/Wwn/Q92b7+6c+nKO+NQeGk25dHCH+rkCBTWAc6ML8G1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izPCDtIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bANgUguL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD8kR3731561
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qMtod9n60PYX+NHvr/34GVR4
	XcSoov8oJ4iS2SIEqXE=; b=izPCDtIPgdqQqJpy+wehLlq5Vfo9PXN90/d7yooN
	/FzGnAdkruPRJLTTOGo1nePC7MVTucYJ6idvDJEaegu4ldFUWr5EtqVdJ+w9J6RT
	HZXeUcU1GTIVGd583QyNz8UN1mqK9mP7QkFU23IbPG38uWEVRBv50M57fWxyQCNT
	ubZo7knDR9eAFxhSxzeEYkJlsmDfZerS+7rxKqUMpTiSMPSb7pN9w/tmhp6Phpnf
	1z9Hp60nlUDIbWrhsQu1yWn2sf3NfQIkCpXF5X5pZicMtWw1QSDM0p+K41kuwFPG
	ThBKc4Q0U9suxRzanPZDGwDEpskvfWLdjmQaN8ypAR2uCw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkettdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 21:07:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b6f869676so59618401cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 14:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774386432; x=1774991232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qMtod9n60PYX+NHvr/34GVR4XcSoov8oJ4iS2SIEqXE=;
        b=bANgUguLp35TR+4jEwMm5yIL8PT1kZkZ2tfZlEWvq3Z6jQzvibarFYT5X4AFJ7tIhX
         5pxanKrIQ9TCgDDMTyktTwXquiTO7uTZAOypjIhNZvoT3EFUF8C5+fKoRCOkWjNiGdsW
         BVawacIVbgrbVtI3bcDQjYOA45fHOibyDZXZuR0qLlyJx81oNsCtj6UN1ERp4c636kzO
         K42L2Z5wsV6SAiHzjtRtrPumUMpmNbIqxjuItr6/mPjCb7b0RjsXmcjg7lc4TLf/DJAW
         UboqBRhAM8Rocm5O+EU6HIWjPspcJWAkn1vsDPsU80ajYtGMjERNRFKFPBuOzR7e3ka0
         JRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774386432; x=1774991232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMtod9n60PYX+NHvr/34GVR4XcSoov8oJ4iS2SIEqXE=;
        b=DoFYuc4tUXNgVMrybmOhtIqTAmY50EJwf4j/Bn4RZiAGBVXVr68SWX2w8QEr1BTxdC
         7WwvPBipFKpMXi305GL5lU6VwznafbN2Cl+fJN8KwxsEguoWBsrJOPSNYl0M2vu+KVAB
         IhuYqeheJkRS0bpKwRz/YShEKmCzwVVzC6D5N6mYqdfl1zSnHLqcco007QcVexb4Zv93
         8VN2rnhGn7jNdRX843nIWQ6prmPtUS5YrUWgVyv9TreVb1aIeH5m/CflPizOlTFPlyD0
         Hp5UTC2IqArMFL3XdLaC2ENcAdrPgZrmEJYTcppi5v45cABGYbwaj4jeeCOqCQGU57nc
         MbRA==
X-Forwarded-Encrypted: i=1; AJvYcCW2MXtQuLO4lGVZm2gVsJCRU7ty68PNQzxLP2x3p4oKPszG67d8ZkssiKtnbhb4XbydtqIkAFeg4LUA1VSp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JAa9ykqmg0VTQ4ACLeQ5C61/G/KsyCsnXdmOKlZMd4vPl9p3
	GljDa8bj8M5/4anQ7IvzTwe3DwG2yos9C8O6ZhW7UOOwA/coLoO6pN7uV7Qa7slpxkWaaCyfhqq
	bbhc3mDxrTEDOPZl3xRhcx0Rz4HrEFPwgQSLY02KAY39k1V2UKu4D8kPQlia8J6x8gQPv
X-Gm-Gg: ATEYQzyJYAQatV3dXJu2eVBSAux5QOfxz1RgDSK7nzAQ+TYKqa+ylDdRO5evXaMDSOR
	iTHoG5g69MdgRev2TyYKyxtrMCOVgqbgZHCt/tkq8VFTkeQtdy3bOY7Fyja0OXtUmMJIuFrxNuc
	iub6o2MpfYas8eqD2jgcX0rQmR8m+3tCPlI7z90obokRtjzB7+tznqhWvLZ59XQPOB1u123RjpU
	D3nJv5KYpSpxpBjR7BGZPvStg/9cnRIx9WAiRkJP8Q7N4QQ5az9cC4fUBb7cog9fCnBkGRZCBni
	Zn06//edaPVbg5EOAERHzg/8aX3TmP+/mfZkHYEua+NMPfWVrh1d+RO98VT8dj49zwcTu4GPpWU
	bcGzhGy0T50PUIWh/T7KNrFQrzutfaiTBSvdkxiuNsvyx8Xb4r5S79iiLWRqsJxzv75fghojoHI
	1XHxGpRrklhh1F1pvlPhaFgyMYbgNLOmTZqBY=
X-Received: by 2002:a05:622a:4d4c:b0:509:2e61:43cf with SMTP id d75a77b69052e-50b80ec102bmr17916571cf.65.1774386432012;
        Tue, 24 Mar 2026 14:07:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4c:b0:509:2e61:43cf with SMTP id d75a77b69052e-50b80ec102bmr17916051cf.65.1774386431591;
        Tue, 24 Mar 2026 14:07:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28519fae2sm3351048e87.20.2026.03.24.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:07:10 -0700 (PDT)
Date: Tue, 24 Mar 2026 23:07:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 10/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <cor6zaxqrb4bykwnzfkm7qiuvrk7xbmnfitzyefhj2iwbejq2u@75ctntjuzytc>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-10-29d70ca1651c@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-judyln-dts-v6-10-29d70ca1651c@postmarketos.org>
X-Proofpoint-GUID: hlv5tsHloquxt5Vyg2xnuE2sPzUjK2Qv
X-Proofpoint-ORIG-GUID: hlv5tsHloquxt5Vyg2xnuE2sPzUjK2Qv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MyBTYWx0ZWRfX4Tik595ycp9P
 YH71NxdHXzdTMtqCTK66vnuDW4Z3Z1HkfulLjjpf3108Zi7U+uIa3hxy+k7JtjQBvlQ5LHphXne
 UUmXqCqo5aTlHII4sButEgwNAvmTjqxxdJWT4rklkCI2KuUbG0Xmk+lM8polNy7mN9kaqeoq+7C
 X+PmvOgYAFTmGLuUz37iDvRDff/RNcTu/c+D/fsmGlhuO+Iwj0f8o/9T7rW/IvfJt/ASLXii0J6
 0h1ml2fsOFqeB90JLp4ewnI4n5ejIWoL4UCleDQZ/6Si+i6QksZWtyFK8fTefHL9aP2rnOMqdvf
 Z9zPgJZfIJZQWaOAvcL5Me7AlOULJEeZVnNrChypt+VDrxLwpDfwoULyJaneJVukoMECPV+ekcy
 2I3HGT/CVU3KAB5DZJXWUiPtyLzSK+olIs5xNUyrAVAxxVcS/0JKK0vzeJJquUGR9yIiSjBXTn+
 F43mfJJ4Q1TXwjlxTFw==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2fd00 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Gbw9aFdXAAAA:8 a=IqCYnrxLgLuRO9zwK-sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240163
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99738-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,postmarketos.org:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1917B31CB37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 07:06:40PM -0700, Paul Sajna wrote:
> Wi-Fi now works with this patch, relevant firmware and
> qcom,snoc-host-cap-skip-quirk
> 
> qcom,snoc-host-cap-skip-quirk has not been approved/merged in mainline,
> so it is not included here.

Let's ping that thread once more.

> 
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
> ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  4 ++++
>  2 files changed, 14 insertions(+)
> 

-- 
With best wishes
Dmitry

