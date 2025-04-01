Return-Path: <linux-arm-msm+bounces-52923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E42A774C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C47C16B1C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 06:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A880C1E5702;
	Tue,  1 Apr 2025 06:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ijlsr9mC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460FA1E0DEB;
	Tue,  1 Apr 2025 06:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490408; cv=none; b=PQ/+0Y+FtCZYwrjQE1Ln42eKOmKbp9ZiZv+XdATDNdlyVVWUaVO1yZinTDRwmL6az2gfyutxW5LPVQ9pyNwPfeYwaIiQ/pcga0yEUDMhWX35iKD+Vxu5Tynd5FO+ETjwvxYgPfmRjfv/Bb6hBSn5t7L8xyiudlaHrTh7n5p206I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490408; c=relaxed/simple;
	bh=juV0t4V1e//0+gj1OVfhRcLHZvcbuEC/YXrhy/U7qi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZSJn7pHl9w5rbDa/HipxSWEP0MJ0nDlE3HLxx79HY8UzdTXB6Sl4ZexoFfT4xxQYBWjW1fkdudgqY08DT4eHtcdXoTxhkjVQLVEczpqhg1X2B+T+6wmpdgu4M8f1HcqbY4uwqeLDuI/3kyqu7Vr1pXMx1LMiyH8ZrbB1omRDzSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijlsr9mC; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2240b4de12bso77945505ad.2;
        Mon, 31 Mar 2025 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743490406; x=1744095206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juV0t4V1e//0+gj1OVfhRcLHZvcbuEC/YXrhy/U7qi8=;
        b=Ijlsr9mCx6Beib9aBhpcgo3+Q36kb/L1N0fnH7fwLXi5NDAMVI/A8xjbJmGZgN8ceJ
         r9Y7WKvuKk32Dh5QU3dBRtHqWQGIeOWfKCgfbRV2VU7eOtjIhW3bTEKryMC4OaerhbpA
         tCax5VY8DfUR+/OX0CVGyw0jGL86RiRfWtpm7ifhhfbg9OzrIN38CFdXamciH3GZQn8C
         CZkeSfdQGeU35oapgf+eOczxgqaYdIFVvv3Rf7XQd6aae1/fJU+HeJJKbjPUUaw4XhC7
         MzB8w232yY1hj3d9MY1eswc/MJkT2DgV2ZPzEOyCdZsZ1zpX1sDMNLZ4KlR+SCNHIQkS
         BFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743490406; x=1744095206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juV0t4V1e//0+gj1OVfhRcLHZvcbuEC/YXrhy/U7qi8=;
        b=jAKbUxkZ8IRevI1Gh7cpg0Z+nXDArmmlBF3I02UzGwI4LejmLlrTsj5Mv81g3rPkXI
         tQfjJfFmUrdUXEXkNfGI5r1m7uUxP5rKqDicsORw9m4oQ742WjUAquhOpIo8wueSk0WV
         PEalBMhriEPx8qKMit1YfMGAuJmSuN7MReIimBitQjHc4B3e30rb3LsjMY3it5qBf2NH
         m0dmikZAWTGKO041mjpR1zelVl1+HZYJnu9CkJwlL6419/AIDUwClqyZCnHsGwu9bzfi
         NJvY1XONxBqdrcODCGNVWZISRWxIRN5Tw7nN640suNIh7hInP+e1pPHPODj7L3pPNivd
         S6bA==
X-Forwarded-Encrypted: i=1; AJvYcCVhzXYgOynar3c6bJvOHpXM/hFR2IQpV2C7N4up4Ca3lYX7t6lTp0j3qLJ+3QGzS5Ynn/WDrfpuMnZ5+Wo=@vger.kernel.org, AJvYcCVsW5HhuN11e4gr47SE18VTiqQAt40tBoIRFw/gnTURyXWCXRvLuFEa/9l75AdG7848UBHWHjhVMnsxzo7S@vger.kernel.org, AJvYcCVupU3BRKEBDh/Tvc8z9rttcksLQhaPb4d5iSRPKgQZxYqsg8qI3QLaP941aVRDn/AOSW/ggMcZptwxj8rg@vger.kernel.org
X-Gm-Message-State: AOJu0YwliIbRqDWl+CNmyCa3F1fphfvmQyQFwbK3xqXv+hCRCmoeYonj
	LPfmQHoR/Xx6av+W/RzxYB0F0M+KTHdTFJyyENw0kFUXTtgmy27s
X-Gm-Gg: ASbGncsZHahf7k55LYJngFXGqe3zVBCC4Io53pltCAn9Tg0y9JYtEbQhFS3aGENwEuX
	otXWIbFqOgftOCZ+CzICyubtvUqEnyUcBJevhQJJsoxlqfSKJt65WLMsCkWuWgKJhvGlNaXTcca
	CVERGNNI8gnceQbv+z2if/SFxwzAw75MbgIVmvtk7hXwVh7qoIhbLdzOS5mqEn01p3ednPKahCu
	Zlths8FqB/RFKHXNWAaQTkVGpOtfonalpjTVm6hTRlJUJSnYjv/qoCYaKcr2zDwwJRl2QOnVOUd
	BaG99s33/q3k1bNul6nNeLWHLF/qy59ibgHSMmUW4iyUPHhGF4a00ivVX0clrTi2ZhOUQZk=
X-Google-Smtp-Source: AGHT+IE8v+2soOjMZ/HxnufMSQX2TKoU0l9zv9vDPm095V1YC/l3ajgioV+dGEqKKpy3wthovX6FNg==
X-Received: by 2002:a17:902:da91:b0:224:191d:8a79 with SMTP id d9443c01a7336-2292f973a1fmr160582675ad.27.1743490406432;
        Mon, 31 Mar 2025 23:53:26 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf882sm80743815ad.123.2025.03.31.23.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 23:53:25 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: markus@kernel.org
Cc: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Date: Tue,  1 Apr 2025 14:53:20 +0800
Message-Id: <20250401065320.20000-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
References: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for your review. No further improvements needed for this implementation
- it already handles all error cases appropriately.

Best regards,
Henry

