Return-Path: <linux-arm-msm+bounces-75587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 974D9BAD0DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B22E3C4D50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 13:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B2D2FC895;
	Tue, 30 Sep 2025 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/DOm/ft"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8291F428F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238849; cv=none; b=XIoIfA/YsbFFUpTxJg0FZLy77j9oDNiyK54brIoMTokA/rRtgsOJ0BOGfCzpZYqY7abcGTp7qcoyvrW7gtmmJu1Aghg0YKLBpSue6to0Qcgu47FgR+y/ZmEK9gKaDDqzCn3yGk7n0iqXQl4c214A2+v8EQX9VrPsZzw9n6i7DP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238849; c=relaxed/simple;
	bh=p280qPQj27zEghzXtASKe/5ZJm4NWAcJ5opk5rxq8ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ej3NE3BdfBBykm63ClLy4BOX7OPhL95d7O5OqTs6g/Vd2clpQSUv6OLNlUTjsAF2Jh5rGA+8WSLVnVpvUuBxyN2kd+YscsEorY7Ba2ddpG0/NttiYIk850JPyOcbsNA11CHzKRh4I84vOVy/dZ2juksvm9s3vL71qTvOmunjiYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/DOm/ft; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3be330b1f5so614682066b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759238846; x=1759843646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=g/DOm/ftd7Mj7D+q5GPZ47BU5tOLnmY/ck72FUktAk8JpiKghPMqmLJIz0rRJfA81z
         rajwp1wcZ/X1BzTw2EVxRWx5jGM6/kH01th+DYTb2komLNSDQQNmlEd2FOtn2osljmMx
         CuKlWT0RI5C7Xsq6pFCKE//xChYbWvR0TvlQSKV2Mp906Uy/IJXlOlJNp/rz8QN8Uz+G
         9C5UxKLCVyC+irERiD8xWv8QMIle6h9li9nKkKuQ7AAvp6Sggbi8373izgrnWkxaiP6G
         FEVf9fJq7KUGrsB+gVnA/MiZEflRYzcCe+dVMaKDLbz/AtEw6SXJHJfZk20IiD5yG7Pu
         WcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238846; x=1759843646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=QhD09YTgoHRbVqoyt3/BDPwTuY1ZoSh6cI/vhAyb6M1sQ826T09ld1iIp0UOC9s9jy
         I8B3ZpStZzQrIFhqca1Bm5uC4a55hChXEZ5YijTw5xnky+3gPiey8ofowgYQd9PLiYF5
         tJzjBIWtzhXIvdTRzReMJ9qJiLYppJEBnJz8XHnT3TcWfxBOLuFeAdHDfpKVKZofFHjh
         gaPOTLW746AG3zk1WYUSSxOXJMTJ/S6whj4p24jC0Sbg0fKVuQpTaT18Uw+9nRzEhNXb
         n1EsctBgxdJ7ZGuaHZUIE65zfW2/TNIU4szB0EBTJP3R6XQ5TetejHlnj1udmINguX6V
         IfFw==
X-Forwarded-Encrypted: i=1; AJvYcCXHM1E40ecf1DTzquKkPNmXockiMYPHJ/dc/P8T3RTsxYd4gGSYv+J7uwZJpipULtW65EsN58tgyDGb7sbi@vger.kernel.org
X-Gm-Message-State: AOJu0YxkwUfTJsK4IHBiUTrnstlwH2sV0YOxJ+VWRXDvuRS5JJxkKEU6
	TKnRSmMl77zrsDHxVqZ/dA/rmb6sNiR2YeCvXe3F4PX7Ek7EiCI7ZSma
X-Gm-Gg: ASbGnctskFsA41NzUVdbOHWlnxMsXPORbtGn2FiRi5M+m3T5SHaukzjdCJpVboQu0os
	CEBHI35gaCkn/GDYVt2cf+u/auI7j5q7vR79JGMLrQTLuESkyzHO47PIhwBvZq6Pj35xVN+neFk
	JIVxhyWk2yDeXnzLxZhX6x29v7qD1iunLdQjgWWxxiiiyqwBr5kfvwbT6epyM5Z6GdoZy2oBB7t
	Sp7JkmjUzyCySl/ptO7wu54JokGLMX5QtGSv1AsuKJ2CO1BMYAdgUG2ywbf/Evgm+Ma6ZliX2ei
	zwEOv/2Pa+9fklv7YW5jjq14crbbyLYjUrDpxmmbFzFK3Q01WLefKy/jTnC6cIJ8GA6m2CZIc4z
	MDytZd3Qf2+NaXRXaqfx3WCtEoFEmi79gQ0MVOn/LiC8go6e77jZcEZihwNO3FvyaEQ==
X-Google-Smtp-Source: AGHT+IFqZj82HIUPV+dIzJvrTOxVkE1LRYZqyDhYctKIsl9P0BboCTyc7K3Z5HX1b2xDNVD5wraHXw==
X-Received: by 2002:a17:907:3f88:b0:b41:e675:95cd with SMTP id a640c23a62f3a-b41e675a6damr413544966b.13.1759238846374;
        Tue, 30 Sep 2025 06:27:26 -0700 (PDT)
Received: from crusty-box ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm1143934766b.24.2025.09.30.06.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:27:26 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
Date: Tue, 30 Sep 2025 16:20:09 +0300
Message-ID: <20250930132556.266434-2-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930132556.266434-1-xerikasxx@gmail.com>
References: <20250930132556.266434-1-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Asus ZenFone 2 Laser/Selfie (1080p)

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..1ad77a68fc11 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -88,6 +88,7 @@ properties:
 
       - items:
           - enum:
+              - asus,z00t
               - huawei,kiwi
               - longcheer,l9100
               - samsung,a7
-- 
2.51.0


