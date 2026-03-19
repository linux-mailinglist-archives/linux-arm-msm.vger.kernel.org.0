Return-Path: <linux-arm-msm+bounces-98779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN8KB9URvGnbrwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:10:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A5C2CD6F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 16:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6E723015DB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9633DBD6B;
	Thu, 19 Mar 2026 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPkg4scY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W16ShqBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BCA3D5244
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773933005; cv=none; b=RWA8SRZHuWFjTkSrwq8yJAvgsJtDhramjxzQNgNhAO+vUkWcLbYvcNcqJ87J6s8yTdxEGuAzGXyWLj+af0oA1JN5DsOhw/2BVY7Y8qbSC3i4JQq//jCPJ0e7sndD3hgnK/YDIG+xpcyYylTm6EGeu+f2nT/I6tmfL4bJKzBxmH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773933005; c=relaxed/simple;
	bh=Pc1ubu/bYE6gTqwIg3qvlUSvofKLXCP/YN2+4oHCJbE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GuJcufs23hEGe/wnpAcVGRRpNSQz79A5sNOCGWMtU02exXuT40YcbUrcyVT1Z+e005VH7hS1j2Q4LQJBGHSUi4ib2Wfom0WRvQPth61lrChA/PFhT9HCAYr2X3Tt7M1tNa6MMrwHnIA4iGFbHpsz6R6vf3HOrOBn+BdcSR8eYkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GPkg4scY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W16ShqBi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740px770558
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZQmH8uMpA096ihQUFk6pb3
	uMh7cSlJ0EWf3tQNTnYlA=; b=GPkg4scYDDWkJ1/9WF1KP2O/lBUOqG+JjO16DR
	vZIuXsbmJahN+I1HCoUPqgvK9rLn5RCP0eqI/n8qDh0eExpqOzEVghtlnwyVv/+f
	VLuPX+6LfgSe/mBfFwvGddart4ZsqRQ/uYeZWRghghT5ax1yrqt8sG+xLlUXOE+h
	AS0FuuGdYiJYZYUgQUTvJcuspASrS+tsv5/uk5BYJYd+9BxiHXlJzsd6zgmM9pxW
	9a8M2CaFldjDmBr8k66tHEVSRniV0Zgyl5Z3Vlne95dcglgxGFVgza7iUelaV22i
	DIkc8svZT1NLRUAxwc3zPdwkVTY3mHDTm13pXeTRDNBKAZkg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d00egbmtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 15:10:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60270015488so7842976137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 08:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773933003; x=1774537803; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQmH8uMpA096ihQUFk6pb3uMh7cSlJ0EWf3tQNTnYlA=;
        b=W16ShqBiy0rI3tnQjT0b4Nzj5pZcTMGn4W1HUjjoSOiexV272uuuXCA/NGKYsu8IJM
         w3Q1FuXXRHkoWabQWfyvrYPO4uzVzt+e4ds6BPtJbtJQRO2dD6XgnkyhAKjsBeUQUYRX
         rKt6iL8xUgW3Gr/jIjc0GABjcpKTluzeISm93MZV9REJCbycOT/Qz35UN6YIxydjyGpz
         tB1nRTDnzJfcN56bCf8kPy197FBsxqP0BsNy0w6uixQEp1kOUpS0mq9NztUOT9bIvswM
         wl4QSptQRKSgWSsPYF1z4TmZCysk5r1/1dt/1rOrmc/o9kkqRHC9QdLbApjU2kPqOtMd
         gwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773933003; x=1774537803;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQmH8uMpA096ihQUFk6pb3uMh7cSlJ0EWf3tQNTnYlA=;
        b=KwfYgqQXEDViBAaI7dCJKtME9OlpEp4fPnjSwdQaSlJpqAMNJXmSAqeG1HMBOzn+6i
         VLoboafPB3V3dAG1L9vUVx1g0p4lbwdFzFNNg0k0S2yKfiVMEEZS5aUt1r/1Hy1TNY6t
         5JC0JdZ7TfsnC97BDd3zhBfHJfgfJBNOxW4PDo9CDjRKt1PASKiRvbOSrADDVM1nKbet
         sV6jLwYbF8oDqZBSQUIeSfOIA1jEE5m1332Q7R7oBHgkauEGpjM/mg5iNibnUzwccmCj
         EmhvdKr0MXi+cSzswPbQgRVPiKC9A4OVohvTdpvlJOra14k3lo37A9uFT2w8CE+iTq7l
         Wx9g==
X-Forwarded-Encrypted: i=1; AJvYcCWTkt7cg1wGSZtIzV5Lj2C+KfuGwezxh6ZC2WuA05zsDuSLrELNDsILC48GbIGxmr5IzMZ5bTko481sfnTR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbpug63a0tcatA9U0eByXk8ogiocItHq9/IsnHluhTl7Nx+l8F
	IDezWKvcrZxZh4vjPCLsBnQoeH07XDtxrzakjsN1QDe2EomAmo6OvC9XQycXqBw4sLYS6fE/0aW
	FllPZhfeqlZDJp634q/2Zfqws3KxshjdQFGlIicvZc28Xs3Br/N9R6wSJm5wGq3ns5A27
X-Gm-Gg: ATEYQzz5m8n4aMtPpJp3JVwIz0yCz2rj8DVl8vWreZOwBljNjqGkBCAK63za2dD7Uw3
	nLGB4Sgwhy7pCO49pS8Gm6345vyicicuFxY89dECcZ6CxQDQ4Ial8so5M+KBX5W3O7Abws1k9P1
	gEPGqe+BLZfpzwVdqB3T5OaRLH4LVl5pxruJNQmG3Vi9RsVffy3tj6MgfQ9rKkr+nZ9MnfjdaKu
	7vdH9ZoDFZ+VprowjTT+aAFm0nm/x435iF6Cg15AdxYLD3YVN1UmxZ0B/NgITmTvjDXiUoHjNgy
	w1HR7oyRs93TL2JJvL2cfMGisw7GDeiv2MpjknFafBddI7TMy/WAIIsdd8BrnnwZKJc63Q0/Zzx
	mZ4vuDT/R70XNoDORC05oqii0Lf0=
X-Received: by 2002:a05:6102:94f:b0:5ff:ed38:1889 with SMTP id ada2fe7eead31-6027d12b30cmr4011818137.10.1773933002611;
        Thu, 19 Mar 2026 08:10:02 -0700 (PDT)
X-Received: by 2002:a05:6102:94f:b0:5ff:ed38:1889 with SMTP id ada2fe7eead31-6027d12b30cmr4011776137.10.1773933001957;
        Thu, 19 Mar 2026 08:10:01 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc61dd4asm32274565e9.14.2026.03.19.08.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:10:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v6 0/2] arm64: dts: qcom: glymur: Add USB support
Date: Thu, 19 Mar 2026 17:09:49 +0200
Message-Id: <20260319-dts-qcom-glymur-add-usb-support-v6-0-fa305b40a90c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0RvGkC/43RwY6DIBAG4FcxnJeGAUXsqe+x2YM42LKpVUHMN
 o3vvqibtIc19kLyJ8P3TzIP4o2zxpNj8iDOjNbb9haD/EhIdSlvZ0Mtxkw445IBKygOnvZV29D
 z9d4ER0tEGrymPnRd6wYqIdcSC2SCVyQqnTO1/VkaPr/W7IP+NtUws38TzvQhVg/rGNGlNzR2N
 HY4JsqkHHkGaZkbMgsX64fW3ZeVR1g+rNuB2N1uBMpooVCiUDnWDE6t94c+lNe57hCfpWLkT5b
 zN1ge2To1rBYKNQfcYMWTFYzvsyKySgmjuSygZFts+srun2hMIys1VinUmUJQG2z2wsIbbBZZD
 VhUTGBWs+IfdpqmX/blWR5zAgAA
X-Change-ID: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=2663;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pc1ubu/bYE6gTqwIg3qvlUSvofKLXCP/YN2+4oHCJbE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpvBG/YM10HdAZhOCJpk+nrTYWg3eJkoM0oI9UK
 uXwdFckOPOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabwRvwAKCRAbX0TJAJUV
 VtzJEADC4ic4ek5ChI/z1n+2xqyEToiXg/E6CGqd5SfpNEmASRDd2BIQBMpqkg+yl8ajM4uND+z
 pTFSH8dajDnGspHZYNOzdSZCI2cDVpYBneQqvVx96D64ndlB/zOmLLnxY9T5OMPc6ssTvtF2o19
 yWllVX9twOtgVafAZbT/3e8cqvDYUVJM24x2pW9UKkIVsIfAsMMpULkFO29zQnOXHfzPQ96+jH6
 7AJljne6KXfq0W8J3yHhbbqCFamx5MHraEDqOhAMW5MsB08kvRyEjR6HbNeBHREuFexuki3j+Am
 WlkcEFv74PXzAezbnltBEFTIqP2xIxs3QGbBR/HO3BAFXNYr2ltUxC8Z8kPMwFGM7mms5sEJ1z9
 f0UdmTd5P1r2OKsJ0riVQq4Lt8jUjs96dvwn9n+kSzmuRcDk2YMe2moyhC7qJhf2srIr+6jWRay
 6yYcFE1AvBAgJRJH25F9K1pa5a/HWg+mLMQQN+GQVEQ4L77P8fnbkWPlg5ZE7jGpGPqRE8AudfY
 9ZYjMcXLTTbeHTuEvAcdcE9x3j3WTyHXUh07g9gM+35S6Dnvz2s9+v+Of4ZmFCAlMR8ULiM4Nw9
 ZPs0YVqcEWxININjYc8CpusxCpm1V2i7S8Dr0ui/q0qWxyvnCybQTqkbMn8jPJLLprG+zQgwyRV
 6hluJHmTAMtDs5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=MMNtWcZl c=1 sm=1 tr=0 ts=69bc11cb cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=E5JcmwgiqHGAA_JIGHUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Rgm92wk_mKxF7hcgkHxO4PO1TNzfQnfu
X-Proofpoint-GUID: Rgm92wk_mKxF7hcgkHxO4PO1TNzfQnfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyMCBTYWx0ZWRfX4zzfaAErUPID
 bu2NpBGWT8AK0ckIUGavNPBTx6IzJrrGKzbI3SdlF91haNF/G0tsFJnK8SDvKfpLI3bIm4B62e6
 Ri4qr6xULTLNK6/hEtj8w5vwfxzlGkpKIdk82r6cFhQg744sejkcxvAiUE27ieQKm+SMIeWCgas
 oEAtwvm7xY470DO5fC3aPF2PiOrSuisvwTwRqHeUtI3tuX7Wu7r8ldXP6Wvhp9S+qloS18bkxUn
 UfSIYkJ+mCnprtV5iCzA1gEreUHRENNGaAWjXaDMfP11eeTlhEaGckTtU8hafqDAhDjebG8W6Uk
 gl1gWPjFcUEo+f4kklSx1Pe9MTQ97br5hX/7wxiJRWEVHwYN402G3am6fzzt1Wa0eYCGs8ANKNl
 Iw1CnG6AOmgccGR8GTtDPamU3mlONMrSYThABVAIWqfVxSVybueFiIcSVpreOXfKyqpH53jdNi/
 6UV4Raky0LkisYOZ2XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98779-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9A5C2CD6F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for USB on Glymur SoC and its Compute Reference Device.

This unblocks the upstreaming of the display support, since 3 DP instances
rely on some clocks provided by the combo PHYs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v6:
- Picked up Dmitry's R-b tags from v4.
- Link to v5: https://patch.msgid.link/20260319-dts-qcom-glymur-add-usb-support-v5-0-b1d9c03d5f09@oss.qualcomm.com

Changes in v5:
- Rebased on next-20260318.
- Reworded the commit messages to make them cleaner.
- Dropped all the dependencies.
- Link to v4: https://patch.msgid.link/20260309-dts-qcom-glymur-add-usb-support-v4-0-6bdc41f58d18@oss.qualcomm.com

Changes in v4:
- Dropped the RFT as I've been able to test this myself now
  and Pankaj tested it as well.
- Added missing second compatible string to pmic-glink node.
- Dropped the 3rd Type-C port support entirely from CRD dts
  as the SKU that I have only has 2. Re-worded commit message
  accordingly.
- Forced dr_mode to host on both Type-C ports.
- Picked Konrad's R-b tags for dts/dtsi patches.
- Picked Pankaj's T-b tags for dts/dtsi patches.
- Renamed the second PTN3222 from "_2" prefixed to "_1", as Konrad
  suggested.
- Link to v3: https://patch.msgid.link/20260302-dts-qcom-glymur-add-usb-support-v3-0-883eb2691a0d@oss.qualcomm.com

Changes in v3:
- Dropped the PTN3222 USB Redriver @0x4f, which isn't there actually.
- Dropped extra newlines from pmic node, reported by Konrad.
- Link to v2: https://patch.msgid.link/20260223-dts-qcom-glymur-add-usb-support-v2-0-f4e0f38db21d@oss.qualcomm.com

Changes in v2:
- Picked Rob's R-b tag for bindings patch.
- Fixed CRD DT commit message according to Jack's suggestions
- Sorted nodes in board DTS.
- Added proper quirks to all controllers.
- Added RPMH_CXO_CLK as ref clocks to the USB [01] HS PHYs
- Replaced 0 with 0x0 in all reg ranges, as Dmitry suggested.
- Renamed all usb_ss[0-2] to simply usb_[0-2], and the usb_2 to usb_hs
  like Konrad suggested.
- Link to v1: https://patch.msgid.link/20260113-dts-qcom-glymur-add-usb-support-v1-0-98d6d387df01@oss.qualcomm.com

---
Wesley Cheng (2):
      arm64: dts: qcom: glymur: Add USB related nodes
      arm64: dts: qcom: glymur-crd: Enable USB support

 arch/arm64/boot/dts/qcom/glymur-crd.dts | 214 ++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi    | 691 +++++++++++++++++++++++++++++++-
 2 files changed, 900 insertions(+), 5 deletions(-)
---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260109-dts-qcom-glymur-add-usb-support-617b6d9d032c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


