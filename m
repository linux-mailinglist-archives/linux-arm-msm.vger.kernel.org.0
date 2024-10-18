Return-Path: <linux-arm-msm+bounces-34990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA699A45A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A20EB230A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 18:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1EE180A80;
	Fri, 18 Oct 2024 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwwcrN0S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6E20E32D;
	Fri, 18 Oct 2024 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729275612; cv=none; b=nJxB930qavumsTEjbOMiOYNlqxUHtjVqTqCDTHQRZmk676MmtaTEKll5+s52nJ5i/YQQsPKYa2CUkVSSb0v7q4hklCnOtiqU/iD1wTr6U0XLnYTKE/HHDjHbC24dKveM7Tr2Zg4qSOXTAApdTT7TwKJuVLw06Lys2PNePs4xyo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729275612; c=relaxed/simple;
	bh=US6wYHtTmiIPfe7F0PYIJha0LzIPr5dbWwCgIHfs67A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcVV4o7QPmFS2Lx0X0PyCLTR7ZNmQU0OaNPBqdQrST+BzKt9luNscvhWOnZoacvH0ForYovEz1Im52lqXMH+UI9zCZoPAQVeG8ew0kq3XiPDLV53VIi/VILmUxR+FLfJom8fyzOd7vDdaZFegIa2aMTP+bvPz5iS617ID4nHin0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwwcrN0S; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7180e45d42fso1361360a34.0;
        Fri, 18 Oct 2024 11:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729275609; x=1729880409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXdqqD8bGG6OJxaDIEw7SSecNousnuE6c+XrVecdcTs=;
        b=fwwcrN0SsbRsQMO49nopv9IedRAGSEfxZHgEx2Ufmo6rcHNbq9kV38SLOblWla0EiR
         mpPAF4yB1M+/00TwEzVoinI4OQBzJKuTHKvoC2xKasPVOCVEehew8VzrPmQYfnJ94IgX
         dp+JdSPxrGGhDNUvmTE275vVehs5RMmkP8w4TksLFiNg0j/9olx9cstYw4Ede2qErFCv
         khfOYQxlt/zzne5DDxhSbx/wC/DRP9y5rdGfYw/ir7KiUfdlBvuc41YQ+h8eyA97y7eR
         Ha4ebsK1H3f8MzVkMmmhg2NoPoU6PvCpKx2MXX9wkOolaf/D61I5j04iM65kTP0NtKlp
         u2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729275609; x=1729880409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXdqqD8bGG6OJxaDIEw7SSecNousnuE6c+XrVecdcTs=;
        b=w8GMwtFliaNxJGqP+hAy1ud8St4vmXAyvSEGu0OhrvZN4HuLzKAbEUOANv3PuBF7yh
         MnXAGqZAHzKgf6nNSwBergeR/gd8WW864CSca1PZ8I0/94DC+ziC5L8/7hePfFM0UnTe
         n8pixy6GDeKXIpjNCethbPWFL1cDT9exVkG7Lpd/TfXIRKPa8ciDsSFmvJaYuTvYiR70
         aWnvDAso7n+skIS6myFnI30kiPViYQe5+lRTjZ1ax8XBDfXNymrcHXA3xLF0mEp+blV5
         wQEzvFKkkgcxCqNmmyqPre+ClfZTgttPjD5qkK3MkvYL+2XhNin8oilh99ya9B7xM+by
         G5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCW0O4wj9une7WRwFQg5jME2RaC34cJ50IXKy21BDvn7mIsEwFxS7xkJqTNPbyv8k4W71mDZi/TTNjPZ3Ymg@vger.kernel.org, AJvYcCWgMv4dFlXrWZ1GzhPsN0YQpmjSIjWKL8X/rOkaVsHEptZk9KDG7y0YYhWEQbcD6I+sbHfxT1WUCVZOq6G6@vger.kernel.org
X-Gm-Message-State: AOJu0YxQjOV3+xKIs8AbtUukc9v4MitixqIHX+5npdi32XQIqp3zv7+F
	eRXWrRnf4s89ntz0GypQFSDXTpsGOK7V3j4ap5iPVzifzohGjYMsSfw3Fw==
X-Google-Smtp-Source: AGHT+IHQy8JqThZ3smkuawhEIfdz33x/1wqGT6NNVJiV+UD4Ijno2tWuA7aHGvaBm/P1stWbExsbDA==
X-Received: by 2002:a05:6830:6618:b0:718:a3e:29b7 with SMTP id 46e09a7af769-7181a5c4d2amr4360352a34.7.1729275609541;
        Fri, 18 Oct 2024 11:20:09 -0700 (PDT)
Received: from localhost.localdomain (syn-070-114-247-242.res.spectrum.com. [70.114.247.242])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb8aa2f668sm340542eaf.44.2024.10.18.11.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 11:20:09 -0700 (PDT)
From: Denis Kenzior <denkenz@gmail.com>
To: netdev@vger.kernel.org
Cc: denkenz@gmail.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 00/10] QRTR Multi-endpoint support
Date: Fri, 18 Oct 2024 13:18:18 -0500
Message-ID: <20241018181842.1368394-1-denkenz@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of QRTR assumes that each entity on the QRTR
IPC bus is uniquely identifiable by its node/port combination, with
node/port combinations being used to route messages between entities.

However, this assumption of uniqueness is problematic in scenarios
where multiple devices with the same node/port combinations are
connected to the system.  A practical example is a typical consumer PC
with multiple PCIe-based devices, such as WiFi cards or 5G modems, where
each device could potentially have the same node identifier set.  In
such cases, the current QRTR protocol implementation does not provide a
mechanism to differentiate between these devices, making it impossible
to support communication with multiple identical devices.

This patch series addresses this limitation by introducing support for
a concept of an 'endpoint.' Multiple devices with conflicting node/port
combinations can be supported by assigning a unique endpoint identifier
to each one.  Such endpoint identifiers can then be used to distinguish
between devices while sending and receiving messages over QRTR sockets.

The patch series maintains backward compatibility with existing clients:
the endpoint concept is added using auxiliary data that can be added to
recvmsg and sendmsg system calls.  The QRTR socket interface is extended
as follows:

- Adds QRTR_ENDPOINT auxiliary data element that reports which endpoint
  generated a particular message.  This auxiliary data is only reported
  if the socket was explicitly opted in using setsockopt, enabling the
  QRTR_REPORT_ENDPOINT socket option.  SOL_QRTR socket level was added
  to facilitate this.  This requires QRTR clients to be updated to use
  recvmsg instead of the more typical recvfrom() or recv() use.

- Similarly, QRTR_ENDPOINT auxiliary data element can be included in
  sendmsg() requests.  This will allow clients to route QRTR messages
  to the desired endpoint, even in cases of node/port conflict between
  multiple endpoints.

- Finally, QRTR_BIND_ENDPOINT socket option is introduced.  This allows
  clients to bind to a particular endpoint (such as a 5G PCIe modem) if
  they're only interested in receiving or sending messages to this
  device.

NOTE: There is 32-bit unsafe use of radix_tree_insert in this patch set.
This follows the existing usage inside net/qrtr/af_qrtr.c in
qrtr_tx_wait(), qrtr_tx_resume() and qrtr_tx_flow_failed().  This was
done deliberately in order to keep the changes as minimal as possible
until it is known whether the approach outlined is generally acceptable.

Denis Kenzior (10):
  net: qrtr: ns: validate msglen before ctrl_pkt use
  net: qrtr: allocate and track endpoint ids
  net: qrtr: support identical node ids
  net: qrtr: Report sender endpoint in aux data
  net: qrtr: Report endpoint for locally generated messages
  net: qrtr: Allow sendmsg to target an endpoint
  net: qrtr: allow socket endpoint binding
  net: qrtr: Drop remote {NEW|DEL}_LOOKUP messages
  net: qrtr: ns: support multiple endpoints
  net: qrtr: mhi: Report endpoint id in sysfs

 include/linux/socket.h    |   1 +
 include/uapi/linux/qrtr.h |   7 +
 net/qrtr/af_qrtr.c        | 297 +++++++++++++++++++++++++++++++------
 net/qrtr/mhi.c            |  14 ++
 net/qrtr/ns.c             | 299 +++++++++++++++++++++++---------------
 net/qrtr/qrtr.h           |   4 +
 6 files changed, 459 insertions(+), 163 deletions(-)

-- 
2.45.2


