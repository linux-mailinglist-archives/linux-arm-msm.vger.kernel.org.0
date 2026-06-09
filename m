Return-Path: <linux-arm-msm+bounces-112259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bx8wGJ1JKGqGBgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:13:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB76D662CC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:13:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hKIbL1bN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JeNV7wUk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112259-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112259-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 684793042F27
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 17:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021F64ADDB1;
	Tue,  9 Jun 2026 17:04:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C84A13B9
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 17:04:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024654; cv=none; b=naag5G1VLrrjmCrsppzpRQwMQ8vK46Cvjxx+Kmd+XP1sGUktLGn50y5fQfVZyr577uxC1BQyX9gHAYEKCmEba3tpi2/5jksvndDAYhcA4we/kD4rlUjCl0nD0iIR5Hg9pCseK19OLnvU6UlollkofGunxGU/xAuulWQ1bIQ+0qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024654; c=relaxed/simple;
	bh=f7uGfWBPhAPEIOwMA/ZXAQa3n2LNQ+IP7qQffPRMIsk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FsEnvg30SZJJdUUUOchXisyqF5QnDrNFs6JsKfVWlIaBTBlP0O52KuxVqPiONw4WO63UCiZVdtuVyDQOIuEgiXD/o5ot8DKtdWRyLohn0Z6AsP9daXjBpZkGnQikOHYRFSufReodP928DU0miR10TRYP7aN5iTO/yZA2uMXizbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKIbL1bN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeNV7wUk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOkB03161740
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5+3W8CpejAaawVyvTeR8WW
	M1plkP0ngi9KhMkGJPpxs=; b=hKIbL1bNZVf8hW2l55rpBtaTdiAUv/BwPoLKWD
	QE8tB+BqpaheGUcSQson+Tp2VBodBJh1l2WjvnY57bedTT70wlaoIxodhN75Cz2g
	Ez3OxFdO8rAr/azVsES0qUkv/GRznwWjtEmuqb7R7LGcN8GXS2uWMrr2X88AG793
	JmC1y9clVJjZoI1xLDWbXvR2XSoPZoLSa6oF7fhJTtUaz2hY6ccX4ZBmYK8QX9Z5
	Lnmeb32+Zsr/je9Lc+waMy/k7xq9brdnCPNnnO/aGBy0h/Kn/YZo0GXRuVb52t8w
	SHHAafRll12BAKTo4fKMLA8jvAe0kam8RH13sBJLFvY84Qjg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25tthb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 17:04:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8611b27631so2198329a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781024652; x=1781629452; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5+3W8CpejAaawVyvTeR8WWM1plkP0ngi9KhMkGJPpxs=;
        b=JeNV7wUkltjH4bE5fzr3G7Y4qpCGn+xtwjwyLXj3bRjnAGILjh4Hb0BBsUjags2onu
         +3VdSIJr5p22xJJYzfCE9W/B9YngNGZ7uukVmf8Dc+0bhe0Ajjf/n0crrqUHcxwVyI7d
         qUw2DAB6XoxnLJcyAHiOnSp85WvsR2JK9OuVyBqZ8aXsNr8wb70QKu2FAwDo9f77Q3ZA
         Hi3QHfVPlBvQNJk6xGPCwfRscuneSSPmN0U407otMoXX1vuG3eRqgmpJgvJcX4RTKHon
         nLWdZdh2Uj0IgWO1pbkc4IZ44/GADhIPpdATiMshxnal1cDvB9MujvPD99SjwgeuLe5E
         98Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781024652; x=1781629452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+3W8CpejAaawVyvTeR8WWM1plkP0ngi9KhMkGJPpxs=;
        b=lXDKev7/ezLoMpAejUApi5mYPgauAeZrnUInGL3ycHbjrogeS+DB2zC/MYLFSnh7EU
         LH4z3VnaY1u9Y2vqo35EDbZEWTmUbDGlei05pC5t/mJdHr+d5sHFw50CGrNOVvXaGI88
         Lj+PpyItPGhVHKR8/0NdspoqNooMVWsAha1tqMBAr9KmPlVfdto74bvf+Sdj0f13aqmp
         Dhdh1zevZhNpdBihRitB3FnCHBaeA4x8ZDSznU66SI1fOEVUezA7N7yVcbfp6k02vaxi
         MF1LCybYCKK0Jw1Fv/r5hVK1HNgyqHsPXqpq1dHiWZ8WPd37HZ4d3PaguNph3z+DrsWT
         qnpQ==
X-Gm-Message-State: AOJu0YxwlNO0CvozNl6xdnry7US4Vt6Qsn5Z3T6EAR/NsY844t/B38yy
	Y/xVSbNHByI+cAKGrTuvPxijbuY/c/1TvL81G1DEmcf3LNeAqP7b9zdIgHGBA7ymEX2ZGU5uQ6H
	G5UH0UWE/GpFi+snYzlTBPkHAjygQZkLzHEqmgLk8MGQO4lsXuWLlpZqlvh07oOnrAJOf
X-Gm-Gg: Acq92OG06gYN4cjuK5bVwjNzKYKdOX4wEqfejXtymcX9yISVXrMnnhb9LafyXXOEdMe
	8YBxhZHOMpuGwOcqzZwdiP8rFrfw/vE7bEg1c6RLhsCuwEKmV4c/ZGMf2019rggNDCtd+CPMAmD
	j3aLavQl771R+SDpCFzxld/T3uSXaDTzwDJhFau+rDnvEdkG60t/S/HjPwH/xwgKKmDES4j0k8D
	/O4lzAI9Ru6KppFZk+MZr4nxI+2g26XAwnDDeesmvlpcSsh+OfP3ihD/z4x139BuJZE4hSWxJl/
	XWEEVhrLk6ronoIo1b2LmjlSVYTMQ4bLhwaTgwqFHm5KRqtGAN+wMofqebwVZ3TyTamlKOZxvt5
	1R2Qj4qnmveBvj8/D7oqCZh7gBj70N9UGjbeS4pRNAkKdK3blctdkIa41fS2Q+g0UZn3sLplvqj
	+9p3nSgBCp6HrBbugEIEsetbbQ25r1GnAisMhwArecOshYHA0kp/rAyWQulntqPhVorpQ=
X-Received: by 2002:a05:6a20:748c:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b4d3ced3cdmr20503352637.12.1781024651564;
        Tue, 09 Jun 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:748c:b0:3a3:128f:1c77 with SMTP id adf61e73a8af0-3b4d3ced3cdmr20503310637.12.1781024651118;
        Tue, 09 Jun 2026 10:04:11 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b9b3fsm17739119a12.28.2026.06.09.10.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 10:04:10 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Move PHYs and PERST# properties to PCIe RP node
Date: Tue, 09 Jun 2026 22:34:04 +0530
Message-Id: <20260609-move_perst_to_rp-v2-0-6c731523d08c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIRHKGoC/32NQQ6CMBREr2L+2pJSpBJX3sMQ0paP1AjF/tJoC
 He34N7NJC+ZebMAobdIcDks4DFasm5MII4HML0a78hsmxgEF5JLLtjgIjYTegpNcI2fmCz0qVO
 6OGtTQppNHjv73pW3+sc06weasHm2Rm8pOP/ZP2O+9f7oY844qxBLXfEil626OqLsNaunccOQp
 YB6Xdcv3Dw2bMkAAAA=
X-Change-ID: 20260602-move_perst_to_rp-63b4fab37bc5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: _dtm7tWjwOS5GPNqblBqQ65UqCVn64wJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE2MCBTYWx0ZWRfX+pyIiLk3OIAy
 4Fl9S624synrfbHdrfetZNBSLIJL+4Ym2UXLBPRTv771ajG+vN2eatOlLu4Qxmp6PdtifIFkcA8
 TqrIJX+rjm/IuT2hgANNKrFY1iJregTNNNDlnW4KXoWh6Pc9pPstDx3kyuQ8OivivYlnux1RnDq
 vyWWI9F/Hu1KHqVzC0p1S17mO9tW3f4uU6S7oNCpTi2Iy6V3j/BVU8j8EMr91D45nALKmJxI+ym
 NzHIZDRYi81bheUreFnO+8zi39yo2rqSNVLn+poJ1S7rTxFwpnCgCpIsn/QIIcyRODQ2GshmDf+
 4T3YLnnH64Qs/oiAbWpyDCLfb18+22PdLCRPO2UNKehBnqkGxLQHR3goDovXW6STs+BuhO1G8GO
 tUkNdEeplubpHclr5/WkfLfv+aNZe7Wb+N9oUcH2b7WrfLbX4kLLbzCzProUySlvr42Uw2MPJI6
 +0X/7j0Xrs6CkLr+guA==
X-Proofpoint-GUID: _dtm7tWjwOS5GPNqblBqQ65UqCVn64wJ
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a28478c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZjL6ptMYfJ62ds8jHLQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112259-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,msgid.link:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB76D662CC2

Follow the new binding by placing the PHYs and PERST# (now RESET#)
under the Root Port node instead of the Root Complex node. Although
IPQ5332 and IPQ5424 are intended to follow the new binding style, they
still define these properties under the RC node.

Move these properties to the RP node to avoid mixed configurations.
Also, drop the phy-names property which is deprecated in the new style.

Other IPQ targets still follow the complete old binding style (no mixed
configuraions). Convert them to the new binding in a subsequent release,
which will also allow me with enough time to arrange the devices for the
sanity checks.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Move the 'phys' property before the #address-cells to align with other
  SoC DTSI files
- Pick up R-b tag
- Link to v1: https://patch.msgid.link/20260602-move_perst_to_rp-v1-0-8ee5b80316da@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      arm64: dts: qcom: ipq5332: Move PHYs and PERST# to Root Port node
      arm64: dts: qcom: ipq5424: Move PHYs and PERST# to Root Port node

 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/ipq5332.dtsi       | 14 ++++++--------
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 12 ++++++++----
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 24 ++++++++++++------------
 4 files changed, 36 insertions(+), 30 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260602-move_perst_to_rp-63b4fab37bc5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


