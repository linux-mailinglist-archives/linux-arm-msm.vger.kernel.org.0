Return-Path: <linux-arm-msm+bounces-49571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CC8A46F40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 00:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6E903AF3D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 23:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7959125F788;
	Wed, 26 Feb 2025 23:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgT/RQx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B179A25DD06;
	Wed, 26 Feb 2025 23:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611701; cv=none; b=g4sMonp6Knoxgh7VnDUI0sSkbxlwdt8WD7wjcyqSmopvryIwNYLkslhtbLKNuJykW730IQNBrzaZJNP7wejSJXv9ZpZjHGrh1ANlkvOhxSuVkPZx72AKK0A8Ln9F5mt4C6LRtPF/+mEZU+gYZz6ZwXkwl0g06DzhbBuWu1sjl9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611701; c=relaxed/simple;
	bh=Dd+DsKKH30tqD2tiEiRYGeeyXAKEhnXKFNHHlpAK+8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3my7evmWs/NtCgd2y7OG9S1op5VHL1UpbZqGNYGC2cwSfLzyaq815f8RJ9wF3htf9PREADlbaeQQcwTFeCr/p7LirpYlti3xUOUkuZTURAyarjZqo4UL3BYgIU2HBPZR5tAxTsMshIC1XmVcIckGw+rXhVbootvaBMETM8BxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgT/RQx9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f488f3161so147899f8f.3;
        Wed, 26 Feb 2025 15:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740611698; x=1741216498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqJSltE5OyDbvvYDNfk58HM+3J7yQnKjZNMzjNxL1d8=;
        b=RgT/RQx9DLvFdNV23r0+bzjBgywmrvQNr4/XguoE4NJghJ3GPSXU5RJ8zpMTUH/T8B
         XheWGySoA2uBBmR91fcUqL8AL5HglHfZzmqPBppI0XIznBZ22I8IEcZJEHFVUJyTYN+p
         rw8HncQ2j2oHFYNN5E7SwG1fWVh00ilVT4IiRPDaNwOkC4rB9XVS5Bx+StDdHHyBiokt
         ca99abrH4gXDRczZDP1NzuARTDYOuuTxmw97j4555RS/KL/ZLWZYlKRAJrftcNIfqGX9
         GPvPnGiUiTXD7sN2hsm06LyzpJjztlNjEhkPCR+vuqyxUVAeedJBz6iq9W+YVWINdfOs
         TAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611698; x=1741216498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqJSltE5OyDbvvYDNfk58HM+3J7yQnKjZNMzjNxL1d8=;
        b=HaPTkEvQS2jE2+DV7zpFzLKgpAJf+ewc0fo4deAkPm8jJWzJZ9a/lHUk1VgDcsvST1
         jL49+no6zdNAyVFfTDFbc8QjC29Yoqkdox5HX5UKqcQnuuEzzeRePU0u6F8YucBZ91Dl
         TACQ6ZEkkyNQTeWYN94P36xRttEsC3Nj2aLEOBufS55iNpsXhebGkc8iyNYozmKqVfk6
         V/719C/fcTCNWKSj7/Tnsf4pUjFPvVQE0bXLOvFED17d4BV4n2wO/UUSGQqOM6nTbuDo
         pUzqlvWoDwBfjJDSbhmKKPdmrchZ52nQQje2eWQr4YHJ00UAzDMJLtP+cDlrYsWw7r7q
         Y9WA==
X-Forwarded-Encrypted: i=1; AJvYcCUvoiol6DEBzg1EPH/b6thvdcxB2gmP4wn91HvPOs1TMQrgKha+akQ8xjtBMpoiugTDCjS+cbNm/I5jKlSp@vger.kernel.org, AJvYcCX7x/z9PMP4Ngvc+mBKrh7FVdqwlLQT6mxRU4O9AL4wTuZ9TY9GWr/zkmj3yg0ZhVdyT9CDOW257CgV@vger.kernel.org, AJvYcCXO+Vh3VXkOCiV7Fugd0fJc2LoUxTCZ6OriHhEVDHxXMvjkjC8C95ysMxPDcesKT5JR0Lj3vDNYVisx6LjwEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFKxZYpqzqdPwXDYH6tO+CnRbxQ/jSUgGWJHY+hGc+/RBZGkw
	vJWLNK3O7rwm2bSlnAv5NapDaQkU+TluvzmB1YSNk5WRq6YcoOQ=
X-Gm-Gg: ASbGncv7N3Q6HjZ+2h9F5Q5BUqwbkeiYzo+5fVymOBG/JA7rQxpQPSqKm2liEA8dBey
	4wxZdZ6xX8syf7vxnZQuxUt0W+5o1GJzCbSckoeN7x0kj9y8ng7SPB1aNrcsxtxV80zPIdNpnsw
	RhW2CVcrM9+4g0cTutNoX0UgQcUpZ6YFHUP0F/1GIOenbkJo0fXSbRkmDneMpi8E5rHzqRwNtA4
	NfTKX+hy0ifo1Z3dfmAVzzGkCGAkurPjovJRIZjfuE4ifLEHud5m3tQx+5fo5H3019+efzjhbcc
	zaE55KQepXIOcNYWt0vnZpCW4PJr0WuJ03wMcONS3kID8wjOfGoq6XDHbCnTMUS4PFsZc3mZOQ=
	=
X-Google-Smtp-Source: AGHT+IG6mBvGS7nMp6qpUaWIQOJmS2odhXRhI05jOtPyOKNp0mfaNwS40A9j1DBJjlJ5QFgQsaI3tg==
X-Received: by 2002:a5d:47c3:0:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f70772b51mr17609894f8f.2.1740611697760;
        Wed, 26 Feb 2025 15:14:57 -0800 (PST)
Received: from alex-XPS-13-9345.lan (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm238134f8f.5.2025.02.26.15.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 15:14:56 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: qcom: x1e80100-qcp: Enable HBR3 on external DPs
Date: Thu, 27 Feb 2025 00:12:12 +0100
Message-ID: <20250226231436.16138-5-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250226231436.16138-1-alex.vinarskis@gmail.com>
References: <20250226231436.16138-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no link frequencies are set, msm/dp driver defaults to HBR2 speed.
Explicitly list supported frequencies including HBR3/8.1Gbps for all
external DisplayPort(s).

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index ec594628304a..600d0c8a08ef 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -751,6 +751,7 @@ &mdss_dp0 {
 
 &mdss_dp0_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp1 {
@@ -759,6 +760,7 @@ &mdss_dp1 {
 
 &mdss_dp1_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp2 {
@@ -767,6 +769,7 @@ &mdss_dp2 {
 
 &mdss_dp2_out {
 	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 &mdss_dp3 {
-- 
2.45.2


