Return-Path: <linux-arm-msm+bounces-111773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 54LrAySLJmrlYQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:28:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB42654988
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:28:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oVsxb3vZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Stooarc9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111773-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111773-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0274230158AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF51A3B47FF;
	Mon,  8 Jun 2026 09:20:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967743B14A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:20:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910424; cv=none; b=nTvR3te9Qx5mpejPihLz5+aN+5bOeF1ais6AzcbDoXYO3TxG/Tfi0XJItSdpxTFaYU+Mjjt/brggkAx5KK3y2Ma9+iB8ytPt1JznV/R5QtO304pfCPSXawMHTa4ZrjdDkFzuO6Ra2sJEhtcZ/JbOGfGeurO6lqRkSZNva3NVVuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910424; c=relaxed/simple;
	bh=M8vsWRb0TduXx0YG5oELTaktxwy+AF4EpPg7vZFUQNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enTb/WEf6ERL5Et+TRzEY42qeCsDptZgJjGaHx2upKvSFqFwOUVdDWygs3CGOo1GiGGLcZJ3YuLJ3CRoSQuKGKEcGR3c9Rn2OtIT4wp+7n3tSHVK9lhTGdVbgDRW36LhfCZ0qdpy9jg5baCy2ko+q6MFDnnWcI/1ZhLHfUohbDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVsxb3vZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Stooarc9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892Ea22677592
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdmB9dUyho/+Ad19wpdHTAgWRf5Lv7fd8CGgV8lfxao=; b=oVsxb3vZJo3IEM2n
	aBuTw2hwO+1BQ4+9tIp600lni0p3ZkgxdWFKzPmFq/1iWAVYUGURIWgz00YtFHHM
	9TN5HqrF+ROXpDylfQzWQD0juZx6nGHlksiEEasCEQ6CqFZsT0VQhYRLB6ytkziF
	C+Fpglq8OxjO1xIfHUkrXfz0lf3eixkDtamDfmIMi+ZD9+sj6Greof6SMa3deG8b
	ikM9mKZWcmDHoc5yCgsfZEpAPwNQ1QMgU/h5szLDsuwjQeRD+pilJWwjajmDhkRq
	kfg/YbYbaGt07c4HfO4hme0XRRNXd5zodSnHMqnr5fz/YeSuErsyV1NgseOBi/Zp
	1ZuOHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkr2x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:20:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915827fb1a3so86462785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780910422; x=1781515222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdmB9dUyho/+Ad19wpdHTAgWRf5Lv7fd8CGgV8lfxao=;
        b=Stooarc9GZ3sXJVAK8jskXIYnYk1YRxFGBC3yeGxwy7rV0aZq5tg+eMglqhc/wch/K
         a4Bcp5GK7plfORvicaYkItjn8OOfEXc10fMy9IEBbEQdoDYsBfs5xWIkK3Yw1lemBgVZ
         BX22fJwq6ALu73MonS1vi0dKP9a6XuxdhgS9CU7WJLVI55amY1yOUsgE5zxI4dc7mE/D
         8pAeyJH4pJkfN9lbgGjqwDSTvVX+Arvk06kquX/m3Zimr3OLkSHprVwMrKtAWxStLKGC
         Sx/YG5k74lIDD9uJiMqSKNYw67dHE5s5Ex7FhSeoP6O1fFTK2qqr8kSb1zZwfzMZxA2y
         2BiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780910422; x=1781515222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdmB9dUyho/+Ad19wpdHTAgWRf5Lv7fd8CGgV8lfxao=;
        b=STC/6+JHy9EfCco8KL1qOvGPtbW9+9OrbfHLYvj6idLwJeLyxIdlg7U2z2WQIkXAed
         Lopv2x7Z8V0Bx/0DkJEscLg07ixmBSFEaxvK2nuGJzfUzvSvBJexBYbLj1I7mSjIffww
         c+8ezwa0fjNszXODHLpnuRjlvqb4yO2xM/WHod6UzMfdrO9Uv70cQ0T8e+b4Gpk3NcKE
         GtLtqaPw16GDhTDd9GhLcdIfdMr6mlki2YEhWYjopUk5eYlI22MfqNnAE70nlDaoAgrN
         T08BsnZ+x8AsxBXCqDNtdUwRFz/uck1V1d7D1BJ7bBzJ7zDa5nEYaSJlVOaY2cODbDIk
         xy3w==
X-Gm-Message-State: AOJu0YwHrOzV774SccgRi6uDr1xtgHPkzmC54oGz/xjNR18doME8M7EY
	ij38U/eKq/xDLstPTOwDmAmQBsevyG8Iygkf3F/oJLLBcm98707GozvTRFsYqN6TScwj3sMJ/TO
	T9KWo08xigMZuQuyXj+rpBMEl5cYunk0UI+/znFZJKcoUpslJD5Uhjoj4MeFTH27I5pkz
X-Gm-Gg: Acq92OE8uChEF+eUjWxZ5so9XV2iyAx4pZyb4KohpuONzlOncjWe1FBJbHSjfveCX6p
	dfXDZGY7HMt29XSF3bLvNe1zr7TxcLXMpp0yJJMZCkDS2iZCsPfkfGF9zlj/51YNDtatSDqPuSR
	68jkOxp6rtqqKeYVwl0/H2OtfBW2OT+MJsqBG/4MtvNLL7R+x+Y2leNq5LqnXhLgz5X2NKbVMo3
	UqqvEK6us2LJIOCObmQB+yVi52BJyC68jIUkUHtPGyBtXAeQW1x+Ezo0EiCkRjCXxvVVSLyi7AG
	0r3tV6XaECUPXG6Hul5JUQga58J2IOEFmRTfzPGYnxiwcjwT5uT3e92gLc4EjjoDe/CsJ+UXU+z
	AhPZOWAiQDrZSlcXsl86/DEgWqk1DRPz8/2n01dYjdcHQyyOPMJw+qI2P
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr122139741cf.5.1780910421724;
        Mon, 08 Jun 2026 02:20:21 -0700 (PDT)
X-Received: by 2002:ac8:57c3:0:b0:517:5cbe:515d with SMTP id d75a77b69052e-51795c4a9b0mr122139541cf.5.1780910421371;
        Mon, 08 Jun 2026 02:20:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05176fd14sm844359066b.11.2026.06.08.02.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:20:20 -0700 (PDT)
Message-ID: <11c9e2cf-4fcc-405f-9ba5-934025da3341@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:20:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Move PCIe GPIOs and PHYs to
 root ports
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rosh@debian.org
References: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260607-rubikpi-bugfix-next-20260605-v2-1-7bf229978bcd@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tf_ab_1BBSnzvqwPfQc4SugqEirgVhUO
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a268956 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=8ikbXZtZfkZUXiAuQb4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-GUID: Tf_ab_1BBSnzvqwPfQc4SugqEirgVhUO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4NiBTYWx0ZWRfXwVBImJs66Dtx
 4068ag8bRZpdkSzrGLQbhxSD1tY4HpRj5Ov3vvg5I2HFecUAawsnzKNTdLqZ8Veu1T/GCw0hq2R
 K+VNq/6KFPD8LLPhJl7+0dA72It3NNsoCKfCGw7DTbQzFBklXmZOWtHDlbVN7a+K1ybbXqWSSRN
 A4iT7/obJsiqMm7xTMW+uBrsROhBV2F1JvH0DOKzu1Rk45mkBJvGnjmDmLzMTtBE1h4aNh8Uk0+
 NLxHIjQz+6QqGODSL5YH3+tRQki7zVX0uZBGrAsBaNGhVLphaROIHgwrfbBPBkUNCy9uSXdqQo4
 1D84nTmS7u4rTb60uxbqmKoLPDQM+xN7xTkWmccnJN05f1PDw+f12kqwoUeYm3Z+exfcToeHh8g
 OLo2c26wEpra34+YaGLWo5dGCZQwVdFZkNl8W7SP99zQ/rZMqnSfaPFFZdxR1QrpA92npins0uu
 EMABxn55ewmZaq+FviA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111773-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:hongyang.zhao@thundersoft.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BB42654988

On 6/7/26 6:17 AM, Hongyang Zhao wrote:
> The Qualcomm PCIe binding deprecates perst-gpios and wake-gpios
> on the host bridge and expects board reset and wake GPIOs to be
> described on the root port. PERST# is described there as
> reset-gpios.
> 
> Move the PCIe PHY references in kodiak.dtsi to the PCIe0 and PCIe1
> root port nodes, and move the board-specific PCIe reset and wake
> GPIOs in the Kodiak DTs to the corresponding root ports.
> 
> Keep the PHY and GPIO resources on the same root port nodes so the
> Qualcomm PCIe driver can parse the root port binding instead of
> falling back to the legacy host bridge GPIO parsing.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

