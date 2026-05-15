Return-Path: <linux-arm-msm+bounces-107954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCjpFhNdB2qw0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D325559F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7523F331D9B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCF24C6EF9;
	Fri, 15 May 2026 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsRXQNpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES359tD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0884BCAD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863960; cv=none; b=sEaICmoZouzPTtv8FNpowy6z9f9rUTBKV9yZ5HRelaJIgL3U/jW8z19pY5HPGzIpq+nIzkdN7ueWTTrYoCoO3cJHToT+0dZmZu90IQrzWF8XKxl5RIh2R/+vdkrqHm+7+m9O4VMQdngYk5VIe6LLvZ0JlssZW6Koat2ZXWOIJe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863960; c=relaxed/simple;
	bh=NJ6I8L6LZxyBY3lg88p1B7EVw6E27enAgwAu6REGeZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eIAG74EMs+niqqUHCN0yFjOhQ5fPflGB2W4y/bQDzi3WG4QNiCt0FsfwSzUHj5R98aKyDTIJl75mnIhRYhcQhVO/aYYENIyTuPp3Cc2sn0p7n9r4Cw2Jz9+lKAk9gOrpSKqWajolEibvmFaxsKvmXgGWqj2X2HnmaTACpl8uAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsRXQNpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ES359tD/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FGRHdf1831876
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rsUoG2d+Qp84bfDMp0bD+LvUDZuYlTNNuzwOO51dR4=; b=lsRXQNpBscCIpbWq
	NMSuzymKHlX/V4Y9ywxIx0UXG82C4NSFgwXcFrfO80ehwu7UplxEW3harOL1XVQM
	zgnbZGGtlzGH8fMXcg/7rxgeZO6bTVTWa1N+BNyNNw8yan7ir9YRyAqByS70XRVz
	bwe+1L6qsjrNuRIUDJfjfp5rT6jO+KEjK5G95MN1Gl7sTEdAsUpmZcpfcRSVrsT2
	mdFKeSyw/mtm1cTb+J7qCOwURlVO4BaMA2b67X8mWWQSsEVhfn715VrwLWcz9vUb
	uwJHFXHBgdh0a6yUmO9GlMq9naz4HT9i2BW28n87n4b6SVGSakD4iqJYDA5UC1Cc
	8IkJ8w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e671502p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 16:52:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so482265ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778863958; x=1779468758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rsUoG2d+Qp84bfDMp0bD+LvUDZuYlTNNuzwOO51dR4=;
        b=ES359tD/qqcZejrXAdE9T7JYCiV63BWwWq7Jv/39dk6v/927M5sSikqICzenJKi/16
         obZLLYx0T6NX1oiY2/yLaD242amg9Q+phCrg+ZXQC9gQjd8DxUNpCw++lB2nZ0RZ3s+m
         w2jQbjt+oi5N7wMShmDyCN2Dd633mXOqHkHoGh2+IgYXuw5T10Yv3qUHym6OZjwo73CQ
         Wv0jSkJhKHycgNgcaXOrA7VgZY8F/LMYKkTkMB+aoIU52VhaKnb3QKhFJoL7cpzs95qd
         TVCHbvc2cVdWm59vZ0GZhMitKsCBGn0KWqGX5C5dsTCKDlhYGJr2ywjWWAVgycgv11Te
         zHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778863958; x=1779468758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1rsUoG2d+Qp84bfDMp0bD+LvUDZuYlTNNuzwOO51dR4=;
        b=jeXOboremMncVK5/CoY5eciQ2SW3N3KA4u3KVt/YYTR0dlc0ppXBPmFzHMTlnWAUab
         xYKhUexGh5VUEIIwIseAlJGWkkDYMj7KdUMrZ/413Cu17M3kcdg6+Z8x8N/huK2GQ0V/
         ARDZnBdMgo4BBkAuCe9ciZXnoyGYu99ivzYG5WyImOCEn/MLYRE7UkIdLAKGaWjRFL0m
         qi5oh8Ur/+uhLY6k3v2zfBRU1F7qyzxhuxJG8XrW10Z9Smwno1z6ZVRH6Ka9JGq6jaCH
         DpfopAV5BK1UedVAe60O9CUVUF0xUprCE9UrByQpxz/1AUt37IRsKMDwSqn6OoYH/hx/
         WCIw==
X-Forwarded-Encrypted: i=1; AFNElJ+F1qGsm4zeHYbC3fanNTzUVdTNBWri3GrDlDA+0ygLkEPPdptxCraPEW4v4WClVxchWIb4l0/STVHXtbWs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu8EbkaO0k+KnlzWXpmqtZgV7R9ZlyJMpkXBbqFwtWX/pyK0bO
	hjEbdfBlM8Y69EMQ/YSLetQUCPc3QqF49R2z4sKkGeX0lapYZ8ttbtqg7Q1OWZz7luhVBN2s9r5
	k+YzXqmo4J/NC42jMN9TROdV0lY8lUspe78VAafqK0kRAbWCnCtyTFs70L9ebv1WW0YtTXQRXx3
	+x
X-Gm-Gg: Acq92OFfTC117LF3fdo8Pm5dASrnb8QrMie8k6g1R3D4KkpsH1InozPlNVifmJ+FijE
	oqlgru06QL51lqCMKG5v8Smn+yuBHX9lE3edTe9AyqdGJkNaVu43cRzHRi/qyTq4j86wpdUUt9/
	yiKQGj8N7zY2AiX2xeyN/WKyVUoPlBjHHtoDhFJ2uWeYVMOOV/uxlNi5smS1HPGrCyExzLoST2u
	WO1zQBGlLtoQtqacUgSr1GlsAKYRv2SgH3C5rhIcsKTHNIlgWIbVadh2o9grIiZHVSUeoWTBxA3
	iIDIls4fxLULIiqN7kVB/oKOC5kB7G/giEdnDKbgIVEyEjreTq4HbCGJLYaVq5CRiVAbX2fIRRV
	LgGCTtja4KwdJFR2qg5eV9ardLN3QSRw=
X-Received: by 2002:a17:903:3b8e:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bd7e8056e8mr53571835ad.15.1778863957694;
        Fri, 15 May 2026 09:52:37 -0700 (PDT)
X-Received: by 2002:a17:903:3b8e:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2bd7e8056e8mr53571565ad.15.1778863957114;
        Fri, 15 May 2026 09:52:37 -0700 (PDT)
Received: from [192.168.1.11] ([120.60.141.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49a4sm58330965ad.38.2026.05.15.09.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:52:36 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com>
References: <20260428-t_power_on_fux-v5-0-f1ef926a91ff@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/3] PCI: qcom: Program T_POWER_ON value for L1.2
 exit timing
Message-Id: <177886395239.8489.6933092111755683572.b4-ty@kernel.org>
Date: Fri, 15 May 2026 22:22:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3MSBTYWx0ZWRfX7x+FgKswGcb/
 iB0Bz43a6EIsNhrRsT/ibvSb63oC98t4xcJcxnkVZnN7xnDS5DJ6JcmNJ2e9gD9OeHeRsWEZ/Sy
 eQ/gqIrlmbP4jRh0klT5fea3oTrRZflBgLjDWfoP3AlHywRv9vRO5R1pqn7Wja8B9r2eEWTbp2Z
 z0rHRZt/D4vc35l4cjthDZNZ5kb0q/K9oLanxhQqejy1z8CoKATKnnTLqZvtJTzw/+TmJrcAwH/
 WdmwzpM4Lb7NwlHcrZNp2c1dlXzPAfuf7FXHWQMd0m/qVZRq2/YomVbiRFo3hBvnMm5sAmO9Krw
 Cv6SQd3LIIcxsBqKzzEdSR7DPeHPbk62xRGLgGw0usavSDL2uAhVvb6QHoSA4tgTBrUO1rCPK03
 x/CSNXOyk/kvthE6R05whnnFMIkitu8ULeTMwYZDYdqr5O2EK4JaCaEm0PF7MOmDB1Y7ikqhn8y
 6BZ7RRpomdcwOulTBuw==
X-Proofpoint-GUID: czTyp-dnjDudo5hhIa_KNVo-UEuUi0Ml
X-Authority-Analysis: v=2.4 cv=I+ZVgtgg c=1 sm=1 tr=0 ts=6a074f56 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=8TBCxnFsifAbGBbxUCxq8g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=ktJZ1PKzIPGet9XSW-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: czTyp-dnjDudo5hhIa_KNVo-UEuUi0Ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150171
X-Rspamd-Queue-Id: C6D325559F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TAGGED_FROM(0.00)[bounces-107954-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Tue, 28 Apr 2026 14:07:14 +0530, Krishna Chaitanya Chundru wrote:
> The T_POWER_ON indicates the time (in μs) that a Port requires the port
> on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
> asserted before actively driving the interface. This value is used by
> the ASPM driver to compute the LTR_L1.2_THRESHOLD.
> 
> Currently, qcom root port exposes T_POWER_ON value of zero in the L1SS
> capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations,
> which can result in improper L1.2 exit behavior and can trigger AER's.
> 
> [...]

Applied, thanks!

[1/3] PCI/ASPM: Add helper to encode L1SS T_POWER_ON fields
      commit: ea803322d3a8ec4ba60699a21b4ddc8fdbc0a242
[2/3] PCI: dwc: Add helper to Program T_POWER_ON
      commit: a66a25538564850a977ee3cfc795aa05ac4f1700
[3/3] PCI: qcom: Program T_POWER_ON
      commit: fca5f83fa339b357311ed250ec8041bbae11f66d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


