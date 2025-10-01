Return-Path: <linux-arm-msm+bounces-75627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD47BAF3E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 08:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 241FA7AA480
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 06:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9656426C3BE;
	Wed,  1 Oct 2025 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G87NJZAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8B2580E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759300552; cv=none; b=PJMl52Xrhy2Xjwjl/B0AwoBhMbyphy3lOtot8cKZFu+qa4+3lsl/AlAjF48LW3PLq3JAnU2mx4CrWBnHuoaulC+C6HfzCp3JiRFgLVg7md4eQIUb7GIACagJ1quk6WCKyxj+bfshP/yGqDhDSb5AsTZbhSY9ZrSiPrbaFORZ/+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759300552; c=relaxed/simple;
	bh=8M+rC/tJvmhfbfPzx36kQC9pVw2SFMHjgSHET6OGNF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W4mj/FXnPuciEzNy+Z0OPmCQLu6axqYn1WfdZqtQcpl6eXmDcMpWWcysAZt6somZ4NpTO2Doxf+t3Y0k8cemcaHkR3xYxhVMCt7/+uZKopTzqi9EtslczwMNIfmP+fFFrWFZohkxazBAMp64GcjrCCzPQ+kG9F1+tx9Z7hJD2hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G87NJZAY; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-62fc2d92d34so12416439a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 23:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759300549; x=1759905349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8M+rC/tJvmhfbfPzx36kQC9pVw2SFMHjgSHET6OGNF8=;
        b=G87NJZAYW9wnvpKWV+TPXsQLH9VLL8sQnB1i+RzjWkkaxkcxa2aZOPS5SEABD28JYW
         VqgpJKkl6oaZjc33vgsv5qReXc6vCCAvwN/KMrWv6qxuOD05TtyCVmMvxdOffMDtVE5q
         QID8RlEfwZPfPTSBobJdz24AjVxuz1YMaGzbUrhcWlURs03OXI3Qy1zIOoJOM9eh3AYZ
         t51urkgfwCVG41ZsMrTMmoRJL+IqJ74YVhYgGDfs6f+T3BJYzDc5suwy8rj4FJwEdvn1
         L74rc95DOx4FYoqUK0HB+MYo48A5LeLLpotAkuxR9h+X1Way5FqsDPT9frIATvZ7hbxZ
         767g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759300549; x=1759905349;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8M+rC/tJvmhfbfPzx36kQC9pVw2SFMHjgSHET6OGNF8=;
        b=V1AiGFbJCmpmeA/C6YxqDd/2UMDlnQN+hIG2607V3PY7fJ2SXjlvAojS6MlALuu1eJ
         UWklmsxHe3oCKh0xosKxUTKIaTfSBFL+prqhsSnoCBF+trjlDTSl+HzXtkgl59vhVTaw
         zoBJaa7H5wjSRdq7PEMQf6wsVh+125r+wa6pCgMeHHDNrAiduMoPVwYBfrJnrNBiSJJ8
         3hx/9idbLk0TavOy+OBBytLcgxLOBiNfO9K9i1OIUktJmU+j15PB9q/xNVS+MRzfPaBu
         fFJbAVDkUHNeVRwCssRbUHunAfiJxz0yWsvRKFEUOEnW6Eves4V3kLKlk6cQuz3AQCf0
         kK9A==
X-Forwarded-Encrypted: i=1; AJvYcCVu+u2tMHq0rQUi8OqyufYc77ryIdhi9wsIrVTn9QbmdDzdQeRn1jIumolrQ0eAoa21SsMEGeIaCEYju0Fm@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvRykWUFno/1VOjBFhGO0CCSD9dFTQuBb6OvnhFnN29k5/PxO
	p7BnLCM+T4wSxdBkNqfveam6mrAlmDxaP2Do+JaaylOZkL7AjDrJMcC9fbWsnibNsScloGKA6fM
	ZNqvaGJwarU+nyAnnFEB3rkiklfCotgs=
X-Gm-Gg: ASbGncvaqHO0Rgk9N8yt87zMQ3gJa06Il8CDpx+aY3HXX7xk/3qswDvACln+fsTjDrx
	oxdGrw7DCPeWJBbZloa6nNN4ceaLlT02IKQd7Lj1Ts37c5YWICsgw769GfHtqI4vYqQXj7b+HmT
	DJS/CSWx58OwEp389p8vPuzN0givrcI8gNRKxZ8r8YHvSMm4xN46zxuFBrdcgs6svvOzzWZRnTB
	3ZxcvO4NF05nMhE5ahdhbe9IQsqIW/m
X-Google-Smtp-Source: AGHT+IFhSXX+nUaYhO80kXEU0yzPB0CgeIXeTq5vOUpqxyC1AtlG+4GsR51QqMGGOM8phE9y25q6g3x8N6SySVVxVDs=
X-Received: by 2002:a05:6402:358d:b0:634:4e0a:9d32 with SMTP id
 4fb4d7f45d1cf-63678bce5ffmr2832698a12.7.1759300548968; Tue, 30 Sep 2025
 23:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Wed, 1 Oct 2025 08:35:37 +0200
X-Gm-Features: AS18NWCYhciIG058jyCqKMC1WKNMOiPJ72urBhVvFFESB8Xm5N9YYcnUQcQrheg
Message-ID: <CADomA4-SQF3vyTNBK8gJsGRmC0DTr550S+RVoYiaKBRoW4TNBw@mail.gmail.com>
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm8250: Add MDSS_CORE reset to mdss
To: luca.weiss@fairphone.com
Cc: andersson@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, konradybcio@kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, phone-devel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"

Fix panel not enabled on sm8250.

Tested-by: Philippe Simons <simons.philippe@gmail.com>

Thanks

