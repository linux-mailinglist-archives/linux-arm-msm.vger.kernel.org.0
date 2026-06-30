Return-Path: <linux-arm-msm+bounces-115387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oU0vNmCwQ2qyfAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:02:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A26E3EF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:02:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TBDRS8MK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Cn3kkC7R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115387-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115387-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE3DD308F2E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639643FFACC;
	Tue, 30 Jun 2026 11:33:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2C238C41B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:33:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819219; cv=none; b=n9VZhCxtGkN2kUjx4yaGi89F3UBH1nzOwsact8KL+ZrXyyjYU2Jqxu18R1/cbRqSojXieEUafamWva+Q3URund8PvbmBHg/iCfJFHE8gWgRcvMsJovDU9+36R7IjYxmHPexGXVnAw44Pp/pxJOLlN7wljbssYuTkBk7BwDpQWic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819219; c=relaxed/simple;
	bh=l9RlYtqbFZk70E+/GtjbGBCq+MwRPknGUsrxHjSxMm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfFpLIv9zwkd20VUBb6C/6pMKW4gcO4JFmlZ02xZWTfbw0DYljJK5XFESfEoA+eB8h8mtnA3d7jOV0AaWwjLrW4WCqr9IEQnOImrYNlZTBECVKyrAug6a7LVT9BAN9vgtf/W29UT4neElVJYqIBdH5xKEwR84qyKZIKLaAjZoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBDRS8MK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cn3kkC7R; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mksS1602525
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wOCryQXLht4LcqPVS7Zzx0jUrFByxhQIzaqTBMnaiw=; b=TBDRS8MKEyZ2sYIH
	TIr8GAAAspb9WyYEkpnzBtgKmHH+TC+EBL3RKTMxJZM7y2VUd8cJlel7qhitWwRH
	Lt9nGbOYIKgKle34ZRWihTNVJYJR648sVfcD/N/FZH311+8AarpFiU2oIjOK9DMB
	mIy+0lVYEPsekAQ/haxMOYAZKMcVWoVxRW1IgR//+kDK116tS9VZwQlHiQyNEd9O
	+jRDRFXrX+xPzVN5v19gc3xwkrCy2htx5uuZiLFCYFT4EhqDu4l4kdATW2VbbM45
	V7v4ECoTF8qUZ73WCyEbCGA4IS99e6938JxX9l123wtHmWzBTiG64xzq0GPK2ZZh
	GY30Qg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprnku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:33:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a07295d67so13253121cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819216; x=1783424016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wOCryQXLht4LcqPVS7Zzx0jUrFByxhQIzaqTBMnaiw=;
        b=Cn3kkC7Res+Z/gEijT+oxSWT8F/zTTZ8qrAXlMvdhPihU9cZkyugkttpES/ZUxHSTp
         1Zgf1zaBtd1xVBHvkUSZGsOpP41sg0O++Ygv3SVnq3Z+n6rrYgpkOzgXvSA1HVHRlKnh
         eNRpYBF9el8hfUHc1Dog9dKg6v6hkl3Wbg14tOA/85S0Dr9/EJqP/Y255sg2vvI4C1VD
         Ma9sjIwAJ7mlNyTyRl3y2ltW7cJ9KjugorCdSwIragGn13mo3ZpDRbNeG9/HY43kK7UC
         qOpHFqj5hLr9ElVdQfjzfPmmdAl48EnX6kKDQfvQuFR3mFxGmiylSFqXmnCJ+xcc4dw7
         RbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819216; x=1783424016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wOCryQXLht4LcqPVS7Zzx0jUrFByxhQIzaqTBMnaiw=;
        b=f/YDQ9xz57ZF0fzIujWJkDrcHssQIjU4tOaQ41OY4cM/ebUwsoVdf3NxLMY1Wc4gz/
         mVzY6T7EjyuLmf98HuMs2yDE/Q6vW8xfrubv/jU0waXRFWxOFQPk32Hy1IIIo0rcljIC
         RvJhQD33T+KwZFCDzn9hvHsI1c/bg0/dw3RCzcpIAe5gOutkzwoMMlyOIcdkB4+Y5YcQ
         y1xISnU3/3NXmS4EYU02BP+BJlHaX7AVESWXWlj2eAIGqJYtQPS6x8sUonLMcsIKi8mO
         ThIYH3y+v+Z4PDUCpkgkOngIXhzwLaAVvj5gRlDs4auG9mDLinZw11I70JvFnm4TWzZ0
         hUoA==
X-Forwarded-Encrypted: i=1; AFNElJ8/vy1t/sfuxE4U1yze3GFbV7SdZRWSsVtuO4ZfvyF3XCUL3wgf6fA+uJxwNIjCFyYRtyRafxUZlv2Cfr6U@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjtf1caqolAp/85mOFqF1hnZJV/8DTQg/iQRYvupKiWLINjoiX
	J2Y6WzYEy7LcCDKU0ad8XfOpBwhFKRB1GApui/yEtHumMA5kVveHUKG8enGyvwHN+1gH6Lm8iIH
	3kiYYyHyZFxD1cRnKtcEkgCGQ5cDds+jc1K96D+5jAUWKDcSvuCy23xmxnq/Y04yP1q+z
X-Gm-Gg: AfdE7cmtVm/hf1uq4RMOHByVDdJdqWpZrGuiyzSUzpUSDPwYpduVj2OiA6YakmnRd2r
	BvPKfGXKs7FXaE9FZRLAJ/3KZ3Xk1LkRCmfT7CIW67eTT1PS1wDyerY4hQe8PZs4BH0mGgCpHYO
	PFDyjcbIeRP95cG0EMmQHnBmaI5ummPTaIOmhZnriCfmy/T5agxpoXebyhGv7bcpbV2MzxNAgi0
	I7N7EgouEdS+KVW+2sMCs60uTuTlrZlz4f8BMjAUW1EeZDm8cG5TfhgixOKi0isnSqFlu7JsI0g
	vWpFvBkIA09u8c8bXpnmGCllcs0XpyRjcNcEutczRdhxba1aNzOlAaqE7jrUmijIbKYR2WzDSL/
	tYhdt6Q607B8SwbUlWuKbc1NW9hRDCkUnJZc=
X-Received: by 2002:a05:622a:510:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c1081930dmr25350281cf.7.1782819216260;
        Tue, 30 Jun 2026 04:33:36 -0700 (PDT)
X-Received: by 2002:a05:622a:510:b0:51a:8fd2:8ed2 with SMTP id d75a77b69052e-51c1081930dmr25350031cf.7.1782819215815;
        Tue, 30 Jun 2026 04:33:35 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cc89sm109562766b.36.2026.06.30.04.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:33:34 -0700 (PDT)
Message-ID: <8ba8a59c-fb80-45e3-b4b7-0db06614df49@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:33:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add QCC2072 Bluetooth M.2 overlay
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260529180234.3373056-1-yepuri.siddu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zyrI0XTHrQbgwT8wczNgcVy4P5OeHjJl
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a43a990 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HIlf0Euc_oyIobYlzwoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNiBTYWx0ZWRfXzz8a2lW5o1SV
 Sf6oytIq9xpcR6lqthSczh80ysYMsM39oZqr3R6hwmDUPJv/cVwcXJ9ZfG+f/2TZLpUY0iSckYI
 F7NwWOdG9y0wUTn2hQt1J0A/vtus0SfGVgHIzqxotba9h2RjBOaN3+ugFukmxthl0pOXpwIbN66
 RcRhbkexqvffJ7lQa/tLapLUpj9TJyAm2Tmgq0eLg0AVtd/Sj3PD1c7TdW8W9OXwOUOku7OFbOf
 iwGQUuzIaZteFTtV0O1HIvF3Qoyp2Ez5p4JO135NV/rgAUsnOhLbyJbzU8lmgJ6auxzU+pCnyDl
 ULJA2/c2B6+i9PdU311EfzCQB0o/mmonOudqh9ma+0/dn2GIlVLBcMvbBfZLHY1VUgb2G+vo7bA
 EW2HfbwjL16sdwoje+Lwxml5dhsgplg2HM53xphmBF86nLLwSNgzdUOCpoczGplMvpEW4Vzhnft
 tMiAF4fJGEEjFEbk4Vw==
X-Proofpoint-ORIG-GUID: zyrI0XTHrQbgwT8wczNgcVy4P5OeHjJl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNiBTYWx0ZWRfX/6uHIc72yQRq
 MYJ3LrMppxVE4xeF+W/Ck1MLqzth2cx8+99WTsiWIHACZFqX9D5y8bNswcuJUa8keUR/MaGLBcz
 PDXjfW2W/Gc870dHtX2UXFuztiG8Uug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300106
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115387-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yepuri.siddu@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:quic_mohamull@quicinc.com,m:quic_hbandi@quicinc.com,m:rahul.samana@oss.qualcomm.com,m:harshitha.reddy@oss.qualcomm.com,m:dishank.garg@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 117A26E3EF6

On 5/29/26 8:02 PM, Yepuri Siddu wrote:
> Add a DTSO overlay for the M.2 E-key slot on the QCS6490 RB3 Gen2
> industrial mezzanine board when populated with a QCC2072 Bluetooth
> module.
> 
> The overlay configures UART4 (gpio16-19) for Bluetooth communication
> at up to 3.2 Mbps. Sleep pin states are defined for all four UART
> lines to minimize power consumption when Bluetooth is inactive. Host
> wakeup is handled via a GPIO interrupt on the RX line (gpio19), and
> SW_CTRL is mapped to gpio86 for power sequencing.
> 
> Disable UART7 in the base industrial mezzanine overlay as it is
> not used when the M.2 slot is populated.
> 
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---

This seems to be a single, unthreaded message. Please switch to
using the b4 tool for submitting patches - https://b4.docs.kernel.org/

Konrad

