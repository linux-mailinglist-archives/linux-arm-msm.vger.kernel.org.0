Return-Path: <linux-arm-msm+bounces-116747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BcL2DkSDS2rRSgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:28:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D10EF70F2AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:28:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mshRc88f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b3FGOu4U;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C574D3020033
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B38F36F413;
	Mon,  6 Jul 2026 10:27:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E538AC72
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 10:27:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333665; cv=none; b=aghmucWcg5kNUYRFZAKGx6+75cnKoJolFxorpsiQ6pW9STZAMbciAkjlG8MdXWUQl59xIPZlXKm8lahgdhDxq2rwWi2ai/xrIhrjwDmRzRp18illRLwRdMThOyGl24wRo4VzMciFkLAg7iNJRFnSUBPspZIImhjWvxdfmbCoiWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333665; c=relaxed/simple;
	bh=i5REZAAc43M+MJhQ/yiOT7QFRqqFEhWc11/DyUhpPPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y4PdKG88I6sc3ZsjWFmeQtL3GoWhU4XAVggLpbDCw1grQDBgNL4CucI/k1E+eeN6WNBHeORI+P2Ih0A3zV8i4uNA4VDadvkjgFomuGFcmaeFsEg2MlZVDL0n9AQH1V4Nq0t9Dt7YDcuaHfqCqBwFdfoorL7ClAiUVF+Atihs7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mshRc88f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3FGOu4U; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669p5Wo250548
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 10:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzxuDmDI9P3nADMyBmziym9x+XR/HKbUY2Tt7cCbW9Q=; b=mshRc88fxXApwUFG
	KJB9ZSbjMs9DIPqkQND1+cGwJZ3j524UUyIo8TK4PpVwTtOQf6273dAYkWY2IZOA
	WUnAyCqiHOol2MYi6W71//6dEABP3aIRuBW1CUvRR4o9/8BVRQQsZGGZs4zUJdQ2
	kezRJZJJ6qkyZGlhc0DhFotrJzrRmjK3uQMEC3DTLMGDexc02wdWUtnX+aCNZmdg
	jQ9W2Z2viZxfx779woYuuUzTt3PxlHDBPaJKq989lebkgcDBb4tq5sRE841E0KGZ
	BNMw1bDlTEicsL60NQ5SI3Y1KDtH0f2vfX8pQD3LPFvO0BUfg3z1p+IFWJLMO6wQ
	tThFPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr4hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 10:27:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso241110585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 03:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333662; x=1783938462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzxuDmDI9P3nADMyBmziym9x+XR/HKbUY2Tt7cCbW9Q=;
        b=b3FGOu4UHQy/rBsSb6VH2NhtHxGFhLB1V/8cVe1b4NU4o+cil9nn3zUfZVe1pkmgHC
         ReW20ZAqhe/qCTDM/US6M83ast7vmiehz607Fmnp4Wtj4YuU7zeve42d1r1cuv/DV49H
         DMlWGdzfY7k5eRLf2M9f1CBLjHNNUT0Wfsx3F09rveBdZyGyxNfOVGH23/h+s1+qn6Ho
         a8Edyvt3N/0ogcwpmhVB67DVSm+Ugtu9ie9dwfJAEdlQJGeu3n1MFa9wxc/qVBGBwnq0
         itBk4Qnek+7HSux7CW94SaGCdENbV6jdQBg5uEyTfpG9hdVowBRAmcCYWoiYwKnooGJW
         WY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333662; x=1783938462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzxuDmDI9P3nADMyBmziym9x+XR/HKbUY2Tt7cCbW9Q=;
        b=ayYFKVkZJj8uDXu5QMJJxRDQN5rZkB92ECA7pG07Gh8iENhhNJk5U4FcXLQeMXx4oB
         bu0jOs3boEtposgA0SZKmRDtUl3uMrmg97k/hw82ww9wJLdBgmsqR+r02GxCq59/QhfW
         EPJ8j5FHgIdqxxOL0a/R8jfT2Q8Xljk5/hjhm+oZqRR9rk5oRM0GN3qgSc1Qfr04kd4L
         EAlelJRIZ/EPkQgQjirQ8BPFPax1lvLATOegpl0Xjz1Aej4a2b/RcfQfLr9Vkw+crM40
         XPKqAGUwZuxDXEdhA7pz0ugIxdV55OaAnXeFcwD59zZFvn29iWJ2QpIExfuxKJ39EkhN
         TfaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoklXC/82bYMskcwO7CZDdFNcxZWtBFTu64tM94bEpCJ1XNmUbyiLVYKWcJ8PahqOToc3D7Hgjn8D8rI23/@vger.kernel.org
X-Gm-Message-State: AOJu0YxVCE5cK8HdSQWJD5cJZc3/XIrQ/HnPy62WsCZZChBT46nBYuPK
	UQ03kTUo/OH6HZqWCqGh0TScept3ke8C4JZDF7f2SMZlIX8PQ939c3vKFxcy/APD8BhXWQvjXHF
	WBjTYaI9M2QZ8f6OuDZYF/9eY9tkFq8qdpE/PeNT4WIXEgFhWpTNcg4aZ6Z484kxae9TP
X-Gm-Gg: AfdE7cnJp6+vOWNjujIG5DwCD3UE2MoSJ1BDodwgkrJbBr3Ye7HP5fllhaIH3U3ZrLc
	QeCY0+CDiuqpKPBBHgxZ+Q47mvTzka4DchkBCZEAt+cP1D/ExN7kXrE0jQjITWhyqp5cambhy+u
	9EhNVeNOvHE4U2zkA8goLF+aOc7le+hXxLRh44aibX+dhrVI53xaPDluu5rP0/P3l/hzm+uRXRJ
	2qOgCRAfiY1azMaFZe3gwZ0xJXe8ap8JW5WjK6mSALLLvVBi9YDxLktCtr2wC3ciTXmGFlDCBWN
	F3eXfpQrLbgVQGlgva/jy2xeKNMex4DPDS6rcVM2Gq6ffAvuOzae8/zEYdJQYQkyDfZ3yVpDylY
	N2ND46quFZ/I6vbFYUyqTma4ILjjATiGLPOktAnw=
X-Received: by 2002:a05:620a:19a1:b0:92e:6430:3c68 with SMTP id af79cd13be357-92e9a3987d3mr1253226685a.18.1783333662260;
        Mon, 06 Jul 2026 03:27:42 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:92e:6430:3c68 with SMTP id af79cd13be357-92e9a3987d3mr1253224985a.18.1783333661876;
        Mon, 06 Jul 2026 03:27:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm24299273f8f.11.2026.07.06.03.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:27:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: dts: qcom: eliza-evk: Enable PCIe0 and PCIe1 with M.2 and TC9563 switch
Date: Mon,  6 Jul 2026 12:27:39 +0200
Message-ID: <178333365073.24664.13638699281586651515.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _A7ptcohEqdBg-5XzqBrsCao-GHQAml-
X-Proofpoint-ORIG-GUID: _A7ptcohEqdBg-5XzqBrsCao-GHQAml-
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b831f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uuhBvGbuaKCM7wGRyFsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfX34gRNbGc6qnk
 FLeey0qcDNA4F+DaMKZ+JcUNd1N56m85LT+ii38zVhiTTa1ODdeKJa3IfUcYvbuYFrLTZsg5rvt
 k+x7iILVFnkueqPz+5eQXlpVs2nPMJNhC88bjAxAf+8oe2quPIPTMl0KZcBANs2JXAw85rkwl28
 RUawrL/p5+99xaXr1ggSZA/TlaIULWkTwV1AWlrzLmhLWjIttZNoP+QlI8aoGHcFZGB4DLmylpv
 2o0i1SmutkiJc4X/7UmRI8OEoHsG1WCuB6wUo4qJlfq0a77GWhxCY7hpXmKuO88hOS5qktU+N0Q
 s5weDJ6aLmvaSGKNOtRmqE3E4yCofhuI5n/gTuXTKkxWS5pfRXHx/Hksi+ei+51zWzlHrTo3djJ
 bwGGyvejrxgWdrpiaMjRLs707p9HiLY2ZCv0hWSLF9VpI44CKS96OqKLsD6De8FN3N/f+g+jnL3
 blbQt+ca2+rMslLL1jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNSBTYWx0ZWRfXwD65506OgSGf
 8ToFXBIMSxT4IJPZrs1yTv74a3Cv+nYPwssUmJO7dnBvNsDFDQZIUmC3N/hPiu5fsu1L+ERwexE
 KUP3hKnHhRr2i5lo0vPOpzxcqecw/ys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116747-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D10EF70F2AC


On Fri, 03 Jul 2026 18:08:29 +0530, Krishna Chaitanya Chundru wrote:
> This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).
> 
> The Eliza EVK exposes two PCIe ports:
> 
> - PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
>   via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
>   (connected over PCIe) and a Bluetooth device (connected over UART5),
>   modelled with the pcie-m2-e-connector binding.
> 
> [...]

Applied, thanks!

[3/3] power: sequencing: pwrseq-pcie-m2: Add QCC2072 BT PCI device ID
      https://git.kernel.org/brgl/c/162ea02941a936f8899f3dbe10607b1d5af1b07b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

