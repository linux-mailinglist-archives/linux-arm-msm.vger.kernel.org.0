Return-Path: <linux-arm-msm+bounces-81184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7B4C4C246
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 08:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3BD5D34DB9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 07:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4E132ABC7;
	Tue, 11 Nov 2025 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZK5R/GTy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B932C328
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 07:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762846846; cv=none; b=Rva9zzlbJrMkD7pLRsdMTGl5IcOH21QlLGzSz09CDxdy8HdaL562IKoCJN3YTrwEtq5DK6F2eDI+XXJQrsPPL2zAGcv/p6+F+VXQVlhbXTJMgL37RD4bIPdbVjCnaQik/HYm+lnfHNcfSbkIqIAFi9YRsV6J/34SZ4xsw5BhWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762846846; c=relaxed/simple;
	bh=BXvcCjdO7qB+nC6mPywbTmCoNCrPFNZ+Cz9Suyc+IIA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SlANaurec6kOglrj+v81RqkBdORWAUsXalW9dmiCVudbdxkPdSbok2fjwBmkX+g8d5GoijmYZsOxDr4JVo8MaoP+tzVFYBZ03qeOCvpPh+6caiBzuii0cQBkr38vLm0MZHfgBYeGxT76lW8T2TxONbEc7C/AiqJlP6ZP8RZTRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZK5R/GTy; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so2724648a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 23:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762846843; x=1763451643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsQb36AG+bhheqgPWqJ+04ViBL68K7NDw9cmmMWzaYk=;
        b=ZK5R/GTyhB1K1GLOvYd+np8/twX/3IJUELwy22GZsrbwkITpxssZ3FRQ0CIksB2IMK
         VO46EN45tR7Be4by/9hYyXkvS6xBmWgI3sm28q3gzzH1IHZjCcV1QP38lEXRPF1g4LxF
         76PazOgniBhfAXONZ86nnWCuRaSfYzcxyjp2CWGoKMPZEqFzMUwl9xwFonHyovErRbkH
         g4lFCFEKAoE06WnPLpIoiXFF43QDDADHw34+KKrE1YPEzTaygHs/7s5JpdyGS164VyIr
         xbtBrq8B6kpMX9S9uDwtEgnpF5eTOs4zten9tgN3UrkTgWLgSXauB3qd8hpnY4kVOUGX
         2EdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762846843; x=1763451643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsQb36AG+bhheqgPWqJ+04ViBL68K7NDw9cmmMWzaYk=;
        b=qqnri7R9olaMxgzvm2aqxMsMlCmMfJduEUJweWg0gpJThNzfQZwOXh83blbstFxcO4
         BzTj/3GlWkcUlgCdmPugzn+5NI4K5Ks7tT7m5giD9cTZmwfid/ywzgjTeKro1xF0kNML
         bYTrYZrIyOjhMcmzqM31p4qSxMJAV5z4rGTbNlY8o8SjETE57t5b0nla5dXpD7rVf5tH
         Mxn/3dP5ywonkvCyPnfBNVSYlJ58LOW1S2Bm+rYWqSra9T4MURUuR1XfspnUTsq2P/kI
         CqLQAiw9Q7XdwUhPTAvoRnFnU3J4uSklsgRXKglyH6O1lzW8ruywqdwvLJ6uFSaNSNcP
         h/JQ==
X-Gm-Message-State: AOJu0YxZ4CnKVO96BqjnOjvBFmTPKrGc+YUt7iYsNpAFVckLG47b/qhr
	DNU1CHskHG7lFBnIYa/cGU/OxxbDAxImXV8wE4Maz0I1cw7cVe70K4j3
X-Gm-Gg: ASbGncv9tXxiusOrgxR+PBnx7cnUW2Ep3zSjMuCn6KjyuFGrDN3F5Ozp4MBjOIrD9ei
	/Rgr8D6Zlgp7mCUm4kecMBuVdU6djNPSgnThSQrb4q57JuHxrm+NuJ3z6BCbnDCpMj2jA82+yF4
	ltCYIJWSLGCDc8qvtfIBDBW6xBc7i9tHpblKXmfH2wKs0eUey32TQctFsF7XfUA8vRezgjLtsXO
	s6YcEPGgrEFwLhHfaBDex2Bt/2Pb3+a9uw1bsNjUcXzfwaDcanP2FjG1qFeykLSiwyVlbeTZLoS
	5+KeKbKfYliksEPJz25M1s0p5JpJRIK/mALqVmG6apV7sO6npfWT4LGq89VnSdpYKaU/gd8Ma4S
	5rAzbCIAjmdB3XwITPL52N2b/Em7QaeP62WTtRhfogPGrRQHKswV45+nZT8PCfp8qgNJYeNp27I
	I3jDw1y/iZoBQFpXq2i/j7tLnaMp6l4Q==
X-Google-Smtp-Source: AGHT+IFgWTXwLMk5JFvVCa+4XZXkf4lHdagCP7wOpENFy5OZ1ezyvwlm5aeg76PzyxRG//MwPLwN+Q==
X-Received: by 2002:a05:6402:3045:10b0:640:f8a7:aa25 with SMTP id 4fb4d7f45d1cf-6415e83eeb7mr6906192a12.30.1762846843459;
        Mon, 10 Nov 2025 23:40:43 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f713a68sm13060667a12.2.2025.11.10.23.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 23:40:41 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/2] soc: qcom: mdt_loader: minor cleanups
Date: Tue, 11 Nov 2025 08:40:09 +0100
Message-Id: <20251111-mdt-loader-cleanup-v1-0-71afee094dce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnoEmkC/x3MMQqAMAxA0atIZgNNQUSvIg6xjRrQKq2KIN7d4
 viG/x9IElUStMUDUS5NuoUMKgtwM4dJUH02WGMrIjK4+gOXjb1EdItwOHe01FDFXA+mcZDDPcq
 o9z/t+vf9AHgK5l9kAAAA
X-Change-ID: 20251110-mdt-loader-cleanup-21915aa7b09c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

The series contains two small patches to clean up the mdt loader code
a bit.

The first patch merges the __mdt_load() and qcom_mdt_load_no_init()
functions in order to remove a superfluous wrapper function, whilst
the second one renames a parameter of qcom_mdt_load() to make it
consistent with other functions.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (2):
      soc: qcom: mdt_loader: merge __qcom_mdt_load() and qcom_mdt_load_no_init()
      soc: qcom: mdt_loader: rename 'firmware' parameter of qcom_mdt_load()

 drivers/soc/qcom/mdt_loader.c | 52 ++++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)
---
base-commit: 682921ab33129ec46392b27e9dafcb206c2a08dd
change-id: 20251110-mdt-loader-cleanup-21915aa7b09c

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


