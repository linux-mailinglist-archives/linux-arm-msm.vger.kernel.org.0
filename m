Return-Path: <linux-arm-msm+bounces-96189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLJgHgycrmldGwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:08:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19D236C6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97D263044674
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3024B38B7B5;
	Mon,  9 Mar 2026 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTrRkJpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5CdgaGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98338B7CC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050803; cv=none; b=ExLUGS3XGSkwBKAI3rsTjlPspqS4r/3MGrsxz6RG5bHeRZTrPodGIUC0PGZCZvwhmnKpPS0k/nbClPBkB7iBM6ijUA0kAx3xbmcYAzhO88jkjngqlx0fM1greSUjdAwMjtSfzrFrkQ9NdvsGh9xlNwY5E6MZz2jogqYhPQRX0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050803; c=relaxed/simple;
	bh=nWhNAPhfiOzBhVrNTMsZDmJQ38A9ALefiGQc05qmPak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=irp0uBkEqT7R3zI8wdzD+JH5GLz4t+0ecyAdwldLGH1nksgBsQF1L1IZ0NpwW7fQecS+mzVVoEkQ3XNtgeV6ZGlDd+1ZcUNtOlpoM8E7ZqQVQepmtlxU50m8XBrADpHVTH1/iI1lb4+5yR9f6g8+AgjFeQT/CS3ir4Db0/TOJbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTrRkJpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5CdgaGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298PTBF3046238
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xlrs/nciaVZP/N4VHCfQ2zHYFEeBVdKNE/nyGQcIbPE=; b=HTrRkJpjy8a+gv/O
	jzFiQmTjRqlaDBSDVK4YWjugGDxLEwgauzKtm6xyNgnByc12N7jovu6g26/00Pxl
	xLDx8WpFHHJLNOr3GjY7mMh41gcsZ4UKi6pCeopfDww4pOr06Ac0LL2+BSIMRfWy
	Z14bzoS1FqZrEyAff+JAfB2YxJ2cjxtSLR7KWoqe67rmqrzEx4bHMDW7/ss9kYzf
	mRWXPaVfbueYZrd+F6DbIWKIkMx2+778YL7CHYD2l42OXL+IfvMrUI1J+ygvn6jZ
	wOVNwjQoeAsO9MZfwx9BLuHnag34yUIR1jzppCcvNopD838IkWO8p6DE1FwlgN50
	eB4U3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxvxnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:06:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7d4cc049so1564978985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773050800; x=1773655600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xlrs/nciaVZP/N4VHCfQ2zHYFEeBVdKNE/nyGQcIbPE=;
        b=V5CdgaGJWUPqf+sQzxkN/sbH2AzuYZuzyAl1apT9fZ2h7coiSAMuP3p4M8/bK/H12k
         WRsD0M/OrvJQr97uoaslH4AV6nssWWhIGYlyn2QhHsqBiQ+OhMmDDL+0nmUlKzZ2uQVK
         agVGSNoEWRA1c0wVWUUriTLwaagYDq8eSuzOHdbfJEeCeNQRor65PYEs9Led6fETGtVQ
         uwpcdNkjaupnhtyYlkDz9Tu0m/KyEbTnen6TFWjcFUI5QRd9gLHCW6qejShPcmuQYz+l
         gD2m1A/lcT733ZdKVd4BjWN/ghUAHinlguHp3HDh0iVwWwXUNOKczg6+1DLWFWYYdKF8
         s0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050800; x=1773655600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xlrs/nciaVZP/N4VHCfQ2zHYFEeBVdKNE/nyGQcIbPE=;
        b=Qr0+rUKtQGdFg5Ibj+onGgQGScIQx6L41dV4jZhF8nkXeNx17DAb4/ifVghjj8yPpH
         18djVpdjHjLF0V/qw8utc1UyzsHFm/A3vHWtQHRsD09/xu4Job7F9Vsj0TiETMajUEfI
         OIeLVjpp6/U7NHZ7DQ3d+cvr45Q9PTuOdUOw4VB9t3bRlfJCA+ifL58jP2N5ADqjVFuO
         LLCdXkrc0+WzHFM9ToVSSx9W2JlByetdBHqRPubJ9LeaxVNwDlSucXFoAmnIvw9K2fR+
         4BvH+XL7nMBvF00/YSw3jacBBE8Z+Xb6yyQPz72mOFCH2mKZ4nlPkLUjowGfe2x30kmF
         1Pyg==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZRxOdKbs0dzkPGqfDV0U8vx2yXfheMMBP+nWM8aq+E47oTG2IYgkx7B+e+AQCdqrkp0leVMSbNeP+lWO@vger.kernel.org
X-Gm-Message-State: AOJu0YyPedsxg9R7VfRfFA7645M9pF3l9a4iglfZ5t7tD4CEbrExUdNx
	cw9KXJBs/Iy4YunZaKenu1DGrOIA5lENzJDTDVQ7zb16aSbkR4+Tsl3S44x1Y/DCVCG+MeZ4BPM
	c0X+Sx/j8sW1xo/GN3tAphupB6cIWgtMMequZSx7eo9G49xC4ztZEU+co3pgDZfgcjkZ5
X-Gm-Gg: ATEYQzzYBiuOfFHut/+L58p3krnnjYtLa4De2GCFlSUJCXmT61UvUv/WwAKo7Ihvt69
	QrZkXGUcCl6ku/u4Y8xPJ6WthB6YDTDHxMl95R34+nsKK6mr/9Ws/NWzwR6iJd4H8OkLZawQVxm
	/fDhS93XIFnfcdqangM5GzzqtL9QMMqWq01w+7Sfrxk/o4r4ya3PkbUijwUPkI1IfvqOS2/L0tf
	TFF1Xp/TW6O42tWsVDc1nFDbtG3Eom+9jaG4CKbcjMr0BMV2XtHBN5EUwAVt3/1LNfZNUkc+OZr
	F+F4qwJhSO3UmpLkb7PA46UjXjKG2smM5/qnqffXk4NMyhgFKYNcWy+tDELJquwSfXHuzA9hFaQ
	b4tMF7ESil79GQc3Jss6cbZwuPGPKDA==
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr78103685a.64.1773050798636;
        Mon, 09 Mar 2026 03:06:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4407:b0:8cd:8f66:c9c9 with SMTP id af79cd13be357-8cd8f66cdb2mr78100785a.64.1773050798095;
        Mon, 09 Mar 2026 03:06:38 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm24114052f8f.3.2026.03.09.03.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:06:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 12:06:17 +0200
Subject: [PATCH 1/3] dt-bindings: clock: qcom: glymur-gcc: Add missing CX
 power domain and required opp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v1-1-f682c82f116f@oss.qualcomm.com>
References: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
In-Reply-To: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=nWhNAPhfiOzBhVrNTMsZDmJQ38A9ALefiGQc05qmPak=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprpul8X6ADnOIlMirBe53WkxfduJBrSPaGOc1I
 Uc+HvcZg12JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6bpQAKCRAbX0TJAJUV
 VvlSD/wIfH2EUpN8I73NVh5JgdghJIrCG9x1GOASVFanrTgfYEPW8su8hNlOfTsHmBuiBLL2US3
 p/Q2uqG8a1U2aok042tunLUiwSn7tWZCTY+6zImZf8O5T+ebfaKRYx1cuxnkHNCmAci0CDRQcqZ
 pL31Pqprhk6oZwFPy9fBkSo4xnSG5B3OUTqn+Z6/x6cy14VZYysWeSwsAgQGBaNsx9SnKsFuMG8
 JuJshsTNE8sZVzZUjEdcQmcf7Iao2xeoUTNBcTy+iKH8bNLzFiDy67WUtNt9vwg5hz9/mtH/S11
 t6jtN2AkqM7VafeCZ20UfT/kc5gWg/r/kVDn0h5gsquGe6kSW3YOnFIGxOMhCsCBLfetXryAetA
 Zcu8rDSuQ5KFco7JPfj1/nq8IQoPFlqDQy7+RCuBqxpcgI73i1dRrav+96E+S3WuO6QNEcvcixs
 W7qU9g9qatfSribnF3ujnelJzbzxZaQSSfpJsXmATFOU6JHVRKLTJBhB6Bd+ZMAHRO1W6bdJKWX
 6cETndEQvWAOmVwbchx+hJTMfHEiZnAC3IYnjx3eLQAQpuXEBp2IgiTv6CuTtqAUejVB6O3iUF4
 adRec8jcFm4J6pGPLhBY/6m7LdUK7GUeNuYHCTH0xakmt4MT6fMwmybTx5sqZzTCTCGLqCZDQid
 rr2Rovwcjhc5mlQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfX03EgrYRga/tP
 0WcyXGqx5+d4xzvordTx93Pkx2hCdjbbQVP6BgAUg9kKmjwusgM9rrKY6Mj/uyuzIBws3FgmrEQ
 GgOujV7jYLfawsL4zUivNJvHqj0eMgmQuvSzKQRM/NyVzK/gDU54zBQxZGB09Mfiqou65SU58QH
 JStGeLJc8BS3xh6yTjH2ZJNcPG6C449QKjPnraZKohzaDCqArCWGknajtQH0Kzff6vQAjF91WtQ
 DYnPVOGi0A2sVGxqQgqV1uTE4UxFbzMVG0VjmKahLr4Hl8Lza+zC8x+k94DzrstfBqMzSxLlJ4Z
 0ZcGXUIPaY01Pp0D798X5DoY9ucdL7yNyLAzZA8SvIA+7ZnI2YjaAD/yVIaGsCSx6gQDWz7UuFT
 4liyEyZf3SLQm/9t65rMnzWzT2KBrdhAEz9/d6tkwSuqsrgzqvWjK+OXIyDtD1o+8Msac+aaYJ2
 4HSHnSyixiZ2tK1MMkg==
X-Proofpoint-ORIG-GUID: 0MN9AiwHzKfm5Lwxc4YtdU8-nAle-uen
X-Proofpoint-GUID: 0MN9AiwHzKfm5Lwxc4YtdU8-nAle-uen
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae9bb0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LvnajV2DHpQ1gAc7Ay4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090093
X-Rspamd-Queue-Id: 2C19D236C6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-96189-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.1.134.160:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

It has been concluded off-list that the Global Clock Controller needs to
scale the RPMh CX power domain, otherwise some of the subsystems might
crash or be unstable. So adding the RPMh CX power domain to the clock
controller which will result in all GDSCs being parented by CX. This way,
the vote from the consumers of each GDSC will trickle all the way to CX.

So document the power domain and the required opp to that end.

Fixes: ee2d967030fe ("dt-bindings: clock: qcom: document the Glymur Global Clock Controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
index b05b0e6c4483..94a911855776 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-gcc.yaml
@@ -65,9 +65,20 @@ properties:
       - description: USB4 PHY 2 pcie pipe clock source
       - description: USB4 PHY 2 Max pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
+  required-opps:
+    description:
+      A phandle to an OPP node describing required CX performance point.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -78,6 +89,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,glymur-gcc";
       reg = <0x100000 0x1f9000>;
@@ -113,6 +125,8 @@ examples:
                <&usb4_phy_0_pcie_pipe>, <&usb4_phy_0_max_pipe>,
                <&usb4_phy_1_pcie_pipe>, <&usb4_phy_1_max_pipe>,
                <&usb4_phy_2_pcie_pipe>, <&usb4_phy_2_max_pipe>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      required-opps = <&rpmhpd_opp_nom>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.48.1


