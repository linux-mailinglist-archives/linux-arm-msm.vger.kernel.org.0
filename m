Return-Path: <linux-arm-msm+bounces-111779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6Y05JhOMJmo2YgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:32:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FBB6549E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ODHjDIc2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aZYuuHs0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111779-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111779-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C15963007227
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868DC3101D8;
	Mon,  8 Jun 2026 09:30:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FCA3845B0
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911058; cv=none; b=MuczM4sXokUHbEn2Rf+/DPBanj1ZEBK93bUIw3GYMUJouF5bFh7z1DXbcE0G2fG5ldFyAk4Lvb5v790O54SteNYaTZdhAeqlxGgU343h+MnUlFF/Nky4gtnrcJLxHySLazNqvK3Y0vD5vyGqt/Smu6bay2vEPfAYvd0IvvmBP0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911058; c=relaxed/simple;
	bh=7etrQsKPXJgspwHdPEkFVaZqpdV1j5zwr6oRj2zu2SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PWVFRG6/t8eKU9kjDdoVyyBQBLYagSyTx6CzY4yzCNK0PDJLyAdLns/W2TAfAOGyrYWsPt5kQ0pp5i81Odrx7gt1TmdznDefDdkbqERkLi+C8VRreMbREfiVF+9KxoLPwMGa6Ok1uHMswWPy0wLb2n7bDKRjxHvxpYrCreSCt4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODHjDIc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZYuuHs0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586RWdl2833497
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtXahxCwBVUjHp05LHo/UlL4zW3Nu76n6fTmD8M4yiI=; b=ODHjDIc2O3mM8acG
	azXxUkuqXinr03HIBlFcGpALjhq9CYoPOR1IL9MyubhAibE7tG+K7mdRMi7G3JpC
	4cpvGGh3Zni1IUdnfbL8fKkEv8y93n9qXWReUWdaSjGHFHnNZZcgsbJ5FNT78ZEZ
	J2YpwKMJTj5oPr3S29kdtxeawOKruogwep9iV/Z1Rxbl249g5NCV4HdfABfSnoJm
	go4hxVr2lx9nW3FehsOazyQW+vFqhhYUqOKmxthhNjurEydk1I/0XG8NLduoC2Cx
	UYP6kQR8uu+PLTWG9jZdGgEgSfGBE9VEg3/pMcorYwatyc9VAPTHoaZIT1RqWFa4
	z5tvlA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4ycrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:30:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915a547f4b3so105131085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911055; x=1781515855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtXahxCwBVUjHp05LHo/UlL4zW3Nu76n6fTmD8M4yiI=;
        b=aZYuuHs0BAc2LJV7GEcL2saECRDyuc1qNhoGsayQ3DpGfakLE/xyclajpxIVk44ynx
         IO6Yqt8lFagQRISUz+YqgN9k/1dKGDAeeKWz1wkxpE65OOC179nXEfI9186I8g1TyX0b
         8RxNrlpLjnSFFyDVmjFzK//h6ZSBeqp3MW8R9aO73WFcm7ozypYhW3OXUtYCXdxtPHk6
         0oqjcNAjHnQyous44GQzXmCuIWKrVDW+fpysDAqZfl9HHNjPXLXnow3R3TxeJ+y7mmsj
         kU2lLJ2Za/hRO9FMa6isn6H2nZnXjYiUlW/FRvr7dplFVMGAzxPj/06Ahy4ZblMkzcNj
         Hodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911055; x=1781515855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtXahxCwBVUjHp05LHo/UlL4zW3Nu76n6fTmD8M4yiI=;
        b=ANKOqzaVQdEyEyBTJIZVbfQiEfg/J58OYFyGxleDva3OiYF3qleH3cFrg9DCrZ1S/r
         l4WmXGJJtrwMZto0sEK0C2axp+J0l6ICachrwxcjow2zsPRgc6/79yNZmMrx4aoI4pQK
         l5t+PlW1Fqaqm2t431I7ujm8pA6UDCcyu7fTw2sYZnVnOc4tw0cPsKGXOFulpk/1zhUC
         hBdJR0IvwDcuI5yk1QHga69knCnvoRkpNBcctCV8z1W5kXPkL9W2FY2HeQLUlgnmdS7/
         kmB7v4O2pbbA7NGdrNio1g4NWNRJv467TLJ6FMRaKqRlbRSm5l3NKALO4lsy1V+NlBBV
         5Eeg==
X-Forwarded-Encrypted: i=1; AFNElJ/AQaKfXe6cQ6CK8bJFv8yMZCx67apZDUmknx2WR4IM0NI5REaOHoVC56i8hw8XNe/BbM8T57/4Lmilo8gX@vger.kernel.org
X-Gm-Message-State: AOJu0YzyKU+81YymeiEPjRPyYn1HcypfW4JSrL9PfBDyXbiqu5Fo6Jo2
	soMG76In/w0NincXtAKghfuXHuluAQEMhhD7ljSWB1OZb38ycbO0v7ys0KCHNpO7MYkZ3I60iVJ
	6ZxVhxRqSpWjBtSeO30wp+vAuZFA7Vw6PQrUluvBBnN3BEGTE/j0ki9SfZDAOqHWjL/oo
X-Gm-Gg: Acq92OHhJrXUciePBoCyhrmPPr8gBmfZBNOxkEM2MG0w3CtmSpeZH90z09+Wi4uGRLk
	PWoF+y+OEKfm71gVc4gXmYN+Nj8c1tmbX2PwcM/WvPOphMyQKoc1DWPmU6U3lfGJqObkeEAlsvD
	B3Cz24oFzp7m1PAZpynSS6X0A6ktuhfsbiy4N80JyQDQn2RwEXzZnZXi5CJDs6v2gz0l4MvKa6o
	nBkyI3ELCN8LA6Fq45BdVRdFHv4vpaUiqbJoYkRz25kwfTsYkYIEuDZ2tdY3U+zwtojWLcXVsL9
	Ci3t2VjQfIsNlMPfLKqrDqg7wzdiO3UR5FJf4PUiWtN7OtUksDGr0/9q7FGXuJ0SOV1lZ+loBdC
	oCTGy70JVbGcyd7umtl8XiJyyv8VVZ3BdYmexLkmGhbCpi21CMQmKKxHy
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1429086485a.6.1780911055444;
        Mon, 08 Jun 2026 02:30:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4607:b0:915:86a4:667b with SMTP id af79cd13be357-915a9de9b69mr1429084485a.6.1780911055004;
        Mon, 08 Jun 2026 02:30:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e051a5sm847234666b.35.2026.06.08.02.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:30:54 -0700 (PDT)
Message-ID: <2bb65878-99c4-4f18-8631-01fc1c60a05c@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:30:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: qcom: lcc-msm8960: re-apply PLL4 mux on resume
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602045002.290918-1-github.com@herrie.org>
 <20260602045002.290918-4-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602045002.290918-4-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ChWUpqSSahQYIpnQ99qjruwfcYaw_PBX
X-Proofpoint-GUID: ChWUpqSSahQYIpnQ99qjruwfcYaw_PBX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4OCBTYWx0ZWRfX00/4AzFpOV66
 4TtV964GNK+hfPJtf/ujH0g8N/36t7YCNLnWtohpAc3iLdOnrOUGo1SP3bAqAwu+qnm3qPfDf1v
 j0MOvD+1y90Qgys9dJOaDZmcoWv5WxnmdAY/2uTbtq0mevisKwSc3DLTTxgxIVDcMN+Oj+VYQrq
 oWgLReHPRG50uxu5ywHz5r74bsowUtYNdFvS5n5d18e2DvMaMJoFtFt/I1AvSCunu5Sl/jONrZE
 ychE2RRLeYzI5WWw96NjyD7hr+cxWMIrLozpVBVi0qfBaGaQYNi+owYu8Y8/QGZsK98X7XNRKF0
 EiXVOMD10C6P6C3eKNZ/NIFxES01aQ8zyLy3y0MjS4u6BaIyj02lUBdyLhTUfTmxmoj0KMjRPKu
 lLHLkjlYQDmT75RLjOoBV4r8J12/AOQyI9VzgLckyAnKuBVTNbwSj/TkrRMZv/+CJ3eMIBBRt2b
 d8+2x+BBytYLf3NTriw==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a268bd0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=cTwmTnRGAAAA:8 a=-HJkJ0kcVolaLlqfqt4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57FBB6549E9

On 6/2/26 6:50 AM, Herman van Hazendonk wrote:
> The LPASS power domain on the MSM8x60 family is collapsed during
> system sleep, which resets the LPASS Primary PLL Mux register at 0xc4
> to its hardware default of 0 (PXO). The probe path arms this register
> to 0x1 (PLL4) and the rest of the LCC clock tree assumes that
> selection; after the first suspend/resume cycle every LCC clock
> silently returns sourced from PXO at 27 MHz, with no diagnostic, and
> audio produces wrong rates until the next reboot.
> 
> Add a resume PM op that re-asserts PLL4 on the mux. The single
> register write is idempotent on platforms that do not exhibit the
> power-collapse (the mux is already at 0x1 from probe), so it is safe
> to run unconditionally for all compatibles. Stash the regmap in
> drvdata during probe so resume can write without walking the
> clock-provider tree.
> 
> dev_err / raw errno are used here (not dev_err_probe) because resume
> cannot defer.
> 
> Use pm_ptr(), not pm_sleep_ptr(), to assign the dev_pm_ops pointer.
> pm_ptr() is the correct macro for conditionally compiling the .pm
> struct pointer based on CONFIG_PM; pm_sleep_ptr() is intended for
> gating individual function pointers inside the struct on
> CONFIG_PM_SLEEP.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---

This seems like more of a workaround, but the aforementioned PLL seems
to not be registered with Linux.. what drives it? Is there an ADSP on
this platform?

Konrad

