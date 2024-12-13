Return-Path: <linux-arm-msm+bounces-42032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C49FC9F0E0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 727AF188E6DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96CD1E1C33;
	Fri, 13 Dec 2024 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSHcO4Pb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E6C1E0B75;
	Fri, 13 Dec 2024 13:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734097932; cv=none; b=aYoj54peWKRWSSIaDS1o0oYj3E6Du29FqEOJtvvMe8ZSQm2+dqlsJ4L/PiupMe07XU+cnHiPJtsOpQVrHdKWpJTvGYKP338xWoAtmOHiMK9rWcBEAFTaEOIfo3Grrhc1zU4PNJHZBuGtmFE2oRAZKYJuVNlrhJJNuKgo2odMeUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734097932; c=relaxed/simple;
	bh=ceR27GRjzqnwI2qyvRHmDtPNN+nRJwC1feAlVZFtYbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eU1e/WUk4I3r8lHtFxvZFsRfcZLZPWsm1XRoZggTSNab6Sz/PniBig/sYvojAw6P8ZM6HZTqTj6Wy79BLai4iCyuiLqtwKd5nYeAebP9JTgu9hl/r2J7kiKIRzTUxM0DbeIFxlKWvVbZ1bMH5/xqKC3etX02kBjnbKdBdAfaYQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSHcO4Pb; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725ce7b82cbso2045234b3a.0;
        Fri, 13 Dec 2024 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734097930; x=1734702730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db+W6/ijiqr+uXicYoxElyyJAROgdKEqevKgHXWRbrk=;
        b=kSHcO4PbXhmQcZhc2a7zfWfMMxJzwjwI7dgj/o/vPyQuR/0shw8JlPCzDfXbhwKdeA
         KqvO0CN6Zo1vsu8wcBc2wCYv3SZwQbWd+MGGTyOAcKhjAozRVf38V9cc6Tb42REOJF2k
         xBmMOfrAAwKbk1fZ9uSNFwOnoYxmP/r4Z2VdHJJsG2J8xhff7U1lAHmFejcX+QxSeUYI
         NzDs/jMprD/emy5pi3nN6spO1RBmv0tRiyce+tLf7tmpGh93/rSeRWUmqWeoRJCCYWL4
         /or/Yo8ocm+IUiC62/SrVIpXDJ3A6HiSaq9ynvI240iNpbCallM/uWGThc0cGYrgkBTZ
         /Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734097930; x=1734702730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db+W6/ijiqr+uXicYoxElyyJAROgdKEqevKgHXWRbrk=;
        b=ODREwbLu2SM4QgPhcFichRUWHMZzZ4rXqGudOAt5DJ/dc1TVedOnMchKQzsbXVLQnw
         poc2VKGsnwITe3DxVj1tDySkxWAsKtvOl4wQiEbzFi+ZkgF14KbeYx+QDgf3aE+oSJFQ
         QMNH2egYHVbfM6EMYcZzinkWLzYgBCI0ZE4LlwNrqHDbruTFoddMRIfF8hRXl5mGZzSu
         vaZvZ7Oq4rA4PwrenStxovhpQG4F+CUxkiCNwiw83WF5i6uhWtX23sd3m9sdnpqOW4xd
         GEq9U7S/9oYZfqYWL3FXEMcQpNaSPZHqbGULDolmq0Q+0UFBDKJpijekXXWIV2iy38Pl
         Uz+A==
X-Forwarded-Encrypted: i=1; AJvYcCUcYTOCyVzinKc026qVX120ommd4K3gX8R0H1KV4UIMmyzFIWAylM4xf5NXxqw1cZUDO7yncuLtV+d/QQfjTQ==@vger.kernel.org, AJvYcCVahZZFxRU/wZ53ejJMaAJrem7xpk+/USVs98X/J2/LaQwdkrLechFfh+ARu3jKl2lPzbPSfj+oe9nDBsU3@vger.kernel.org, AJvYcCXVw3S6MRLvHnSi7UXykAHg1Rv2+d4L3U210d+FfKALnrW3wK0tOmVuhje2FpCWfdEcb551FbvXv4pF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rolVTmMCy+YdYGjPOEtkYSTQ0PJvLyr5LBvtDwt6GnXM3T/Y
	uxznBbUuRAIAFUktXx4Jn+/fijASdMpY1hZu+kCs4t/UHpKbmlev
X-Gm-Gg: ASbGncvkdiC3BZbHovtxEBSBxgcasilQP7cCBQ5aO/H1zQOJA1zey+hOgLJ1lhoZhw/
	N8d4hS0ABa1Hs+kWxQkerRY58XQ7dW8tRU6rar/HLxy/Ci3/XZVZP8yazcXX+TBEgApyO5freHu
	KCRrL6xG7/QhxtPhcKRqJCP8/xTR2Cw4+bQjjq2KqLzYFRiBbxPyKDmjx6acHeNuXYYGeHMdse7
	55Bc1rB4clrJXtzHARjT/rPWfOroDROaeG4nHqBrNoLhVb8NKhwgNE=
X-Google-Smtp-Source: AGHT+IH49NPellYO8U0w7AAZhp/K3Dl5jx7c2zSCDlbluB7xNbo3tV2zrT4QjaDSpEWtaCLrUsvS2Q==
X-Received: by 2002:a05:6a00:981:b0:725:ebd8:f161 with SMTP id d2e1a72fcca58-7290c14c345mr4730437b3a.8.1734097930522;
        Fri, 13 Dec 2024 05:52:10 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725ef4078e1sm9047343b3a.65.2024.12.13.05.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 05:52:10 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Fri, 13 Dec 2024 21:50:53 +0800
Message-ID: <20241213135055.600508-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <c344a212-1932-47f3-ad0b-c6f65362a699@oss.qualcomm.com>
References: <c344a212-1932-47f3-ad0b-c6f65362a699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Dec 13, 2024 at 8:57 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 13.12.2024 1:50 PM, Pengyu Luo wrote:
>> should I attach the all?
>> # dmesg | grep -i 'adsp '
>> [    0.000000] OF: reserved mem: 0x0000000086c00000..0x0000000088bfffff (32768 KiB) nomap non-reusable adsp-region@86c00000
>> [    2.249916] remoteproc remoteproc1: Booting fw image qcom/sc8280xp/HUAWEI/gaokun3/qcadsp8280.mbn, size 12950508
>> [    2.556517] PDR: Indication received from msm/adsp/audio_pd, state: 0x1fffffff, trans-id: 1
>> [    2.556546] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:1
>> [    2.556594] qcom,apr 3000000.remoteproc:glink-edge.adsp_apps.-1.-1: Adding APR/GPR dev: gprsvc:service:2:2
> 
> (Please don't top-post)
> 

Sorry, I am getting used to mailing lists, recently I write replys with
text editor, last twice I didn't give a blank line between subject and
main content, then quotes were removed when sending via git send-email.

> Yes, please share the whole thing

Check this https://pastebin.com/p2JyGW4K

Pengyu

