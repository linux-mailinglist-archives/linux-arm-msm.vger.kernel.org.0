Return-Path: <linux-arm-msm+bounces-115305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ePtOIt9uQ2pxYQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:23:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 637816E117C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:23:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MBVm7rer;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AeHC30xn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115305-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115305-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E622B300CB07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 07:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6E937DEA2;
	Tue, 30 Jun 2026 07:23:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49A4369A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:22:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804180; cv=none; b=hCiRFX75KBd3amZ6T/7pGrsyicmKkBY69aa4JiFT/yt2HVvhHBZo0zMqVgUu7ShMHZl5QajXC2RbyCYhBDmoA8ieoR3Yc3B5KUf3ZohgNhYbj9ux3tSFI5fsDeOUbCMjuOdYWoJx1Yiql3pgA6S2oT7n+yaYJaPzNOVJy2WXLCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804180; c=relaxed/simple;
	bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHIRGAnxYfeBuLMKjswPX/pbYyaIOnt7U4L86CxZ1nxB/r4eokXAZC0x2PQWnGyMaoT+oDcLiAw8djVGx9Zsw8NPTZAe+9IrxCLdBxMN9FVkm2JirCOmsu6HAk9+B6CROAQagUoMY39bdps/aIPUi1bE8lF+f53n4fbPt7pUnRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MBVm7rer; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AeHC30xn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CXKu1009113
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=; b=MBVm7rerEuLToM7e
	ga5/em54s/0gd1lSDlxQhDUh1Ssatkus5ndnU7X1jhExbUTp9TItMgFrQn8S84E/
	U+3cqZi8C1Ucx44P79ewrBdc7LlaVD9BwiLQs1E+BpkNBYZxarXBFVnHFVnBRJju
	WCxjbp18tE/EjWgopJxxpf1MKRMNHUpI9WnM9fMfrUII4XVaPEFPMZCOBtUfN/Pn
	imzPaZMBKeLZoonFy6SnwD2h8dhTnjFG0ZQPNbZRczPQRwO6449jHC1S9KS7xOGr
	EFOMr9uwJyr0OJKA49Lzh1xvkN09r0QEleaHYmOkaOv+6TTuVlsPQdoVMgr0O13N
	AC8iiQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw91yja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:22:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e97889ac8aso77779256d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782804178; x=1783408978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=AeHC30xnDpj+5fGe5zb9VHrhmhOTVyb1eDcKUZ8/KqeCD+KImaN3w9oGTYiHR1g1Xk
         MYbh4hGme+0LZ7MuwVXULEz2U24GdFqlE8H3a4MOKPdznZ69/yyxL2NYzTQevEneLuVO
         1ghMLk2FTuRQbALfWgtOKSGfFxDX4/c+oN9UN+8mz7G40BvfsPJPJIqZv0XW2JemExGQ
         jgkniby4AWBcIy4kaimvc1Rs1dulfFO/xr5pnL4ke3Q8JypI8CsOgKsYM3lFa83vi2lm
         tCnro7MDXMvv1bFbNyznIKl3zDme88K5ikyZMBXuVvYMZBxhPEFLUjEqUb1EJLuc7uZj
         XyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782804178; x=1783408978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPjkYIgd6uBVjiXZO+qeuxFAyB9wTKc5Tj3EFD8yRO8=;
        b=OQGgDBA2NpIUPIs0hun4U443PAao5zm86qHxMhajnMtxCV1AGS/YiIghPTKmkbafCP
         VxCBfEKlxxh6gsM38tXQ8KCHfWlfYWtK3dXcCLe8/IuioFkSJE/8U77HezTMebIIzP6E
         rcSR1AIPeOfkZw+XXlXenB5e3o6YbKPwX3RK2DPO41B+eohao9L0Pp3HrYug34RuPJsN
         bRvfalqffvPbcsTJVFLUDDjrChbuu9CF6ZZzJZSi8wptDfY8Srdz+6GRfVam+VEsZyJm
         yE/e+MlNhUqpsPy3PltF3JbVRM8exQLVC0PyTskThdxxlTuP9EZbAskb71Oynlg4JG0Z
         7tPg==
X-Gm-Message-State: AOJu0Yx5ntzwpDEhdGA7d+yOJXHYH9Yx2nfAZYFyWxhvovd4Q+fmvJe/
	X3pDttT4LVQAjHImOmP7nc7J2bfFsTUFgHx1wozuaJhRps67dTLkJ5XSOAjqunQ7UCopsgh/Lle
	tDen0le40xVSkfbCb6iITVaPchX2SKLYLGrESVm6GwGMvQONe0R/FeAdShta0uctPFrJ4
X-Gm-Gg: AfdE7clZHOHrKF2QObYFsVx1elzD/pMyoWr42GzLTytXFumgs6rMLgN+z6WkOgJkJff
	ARnkaoTIGHoO2EgKWbjGtKoI1sTMi2tmFIaOKwAn2e9I25ZDC2wWIq7oGzHAHunOAy/R7rb5XKx
	mSw9yElJ5FMcBWWBFZNt7p+k0f8Xl8h1/LjL8xtcqkaY9X7HeMgum2mfOa10jJ+FQVnGIiKmG20
	f3KeF8jEqmx4RNoDkXEpIxTjRZjztrHAVGtH7THRVH18XByCXqjXsiZ5nnjjKOVXdtZrof/zSr5
	iBSAYfB8PHo9k5Su3/VwZzYxHNIoyLgaihUZYu3D+ikMon2nU9WaPEgH4c/vnCsgSFFW8ChCMlC
	mq+CDmTiCc6eWUF0=
X-Received: by 2002:a05:620a:4805:b0:915:9de3:2260 with SMTP id af79cd13be357-92e624eab71mr446575085a.24.1782804177740;
        Tue, 30 Jun 2026 00:22:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4805:b0:915:9de3:2260 with SMTP id af79cd13be357-92e624eab71mr446571385a.24.1782804177069;
        Tue, 30 Jun 2026 00:22:57 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm4718622f8f.32.2026.06.30.00.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:22:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 10:22:40 +0300
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and
 its EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-eliza-dts-qcs-evk-v4-1-18cbbdba6e7e@oss.qualcomm.com>
References: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
In-Reply-To: <20260630-eliza-dts-qcs-evk-v4-0-18cbbdba6e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kbRwuQ9nZ2E+SCI71TauiFrCt/9q8ASgqi1sojHFVAA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqQ27JirRbykaTHOYvPomlIZ78PyIfVodFf25pH
 x5YjnzBW5WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCakNuyQAKCRAbX0TJAJUV
 Vs/4D/0ZlWCUfm+cPt4pPTDyRi6KgEiKIJpI8UEr8oHVclYirIvSLJILLHHEmPR8ESWFOMgVcKN
 3e6VDb7MJE6nH/uu7y5LkRJpL+zgtlIH7zqYdqLXPkHPMph5G/PgJ9L+QHD7Dk3WqnpNmZa3jLF
 tP0xKCbHAAMGLOX7dPNS3yAWgBm7H/NMpuHgsiR4om6iTFrU2AT07GNsW5WQWoOjyNMl0IRZSgG
 X4sdlAut61iNrXrjBCV3xPE69rNtSAXtBR3KpQBd46XDNVhiJ2s0+XJKdBCjGkNQFTqQ57F1ByJ
 JRJqW6G8yK+P1U7IVOr322SVuP+QF4RpUrptHwxDQ7JjGDsBTMCFPEsPq8sgghVK6FxXt/bw0FT
 5pVg816ycx1xbRZ5QM4TXDLhC06wAjNTSCjFkaNv5zHHGGTCVXd07H/tVXAaEcYTOG2UdKxdjxs
 emqZfX5nohwrWFJ5eyeKuGcA1z7UeYzcYmB2mTrythj/ueeilkeOAGkMryFJiTkGlw0OzxgpTuO
 1iXQWjfuHxG/2vm8qCzbvY6HNFOQ71/oapkeqMR2LWJpErA8zA/k83ymogwWZBtUkqsTOMZu3Jo
 w35Cv21390btDN/x1YnOkWwFBw6q6TlluVEpVvQ8XdUOHjQgFT0a303UpYpVM7FACkXAalqpRjn
 TcTOish4zOf70Mw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX2vaVxvqP1YGH
 70kEuXS5RIa+jRGDPyxqb9bjifCre9Pan7Uq0FRNntkpCTGkjI+RIzAq0OM8VgadYx5CpIK9FCe
 Y4ahltW6f1GLA23rZ39mSCDhOiv1BBY=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a436ed2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=oLJjFz4unEmQByRrzroA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tX6jwpVNV6pV7qRTRId1vPaCJAAIcFDM
X-Proofpoint-ORIG-GUID: tX6jwpVNV6pV7qRTRId1vPaCJAAIcFDM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MyBTYWx0ZWRfX2tbWjkvJPr2Q
 MPMDeT2cdVtL90iiVhBhWnh9oSMAYauwhEEKg1I76wR2aXpqqgwdnqE+rG+ebCJ89AYHBWxuM8T
 vVBQHgwWculG84U+99rHwwwY0RVUunJBBC6MwGojNVho90Dx9Hl/DgfGLIb5LjkR0mdqyR5s9cM
 G3XIDVdCddZpquDWAK3VizNsLDsvo6BA4bqdTgT3EJ4b3n7PhPI/IdZKGF/yiva1CaWoynVroRe
 J86EMc7eiFPeBwi9j7H/l+zCuOMlnGODgiYmLWqeL4NEri/+U9Ht6YPD4owBPuq6h8sDkEESdp2
 jSdz2KUuFcPA0iQM2f0SSopc0lnTSs9xnyV49TFcZgEn2wjwqfhLtMUR64GSJ979gcOwbee9zuQ
 saHucN/pemz7if77TYOFKfiW9G2ULKkKrcUcgTH1bSZuM3Mw9ZsStH0g0fZXZObilnUKEvKi5Nd
 qtoyeMjLsOsLsPrL7xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115305-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 637816E117C

Document the compatible strings for the Qualcomm Eliza CQS
System-on-Module (SoM) and its EVK board.

The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
eMMC. The SoM is then connected to the EVK base board, which provides
a multitude of connectors for peripherals.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf7df33c1da8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp

-- 
2.54.0


