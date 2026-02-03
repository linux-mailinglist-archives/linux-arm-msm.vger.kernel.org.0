Return-Path: <linux-arm-msm+bounces-91683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC2II54ZgmmZPAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 16:51:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16863DB875
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 16:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 472883096BB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 15:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4CB199FAC;
	Tue,  3 Feb 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wz+J+iEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABEA3B8D77
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133599; cv=none; b=MKHRdpLrw8r1SIQ1zBdROTV4fLo5qp1XbOU1+4Ws2cgbpu3S3Rp1vn7zpqBh5bss8KpQdr8TcYkAoCbzuZUb/YgpAV/KU6FFqBh8lK/vQSI6hAK8GBKg8M4wQFDjUZb1FcDgDIyphy/+iOcpN5OfOZzPz0fSQ0oMkJbIORvYlIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133599; c=relaxed/simple;
	bh=Rx6vnHQPmCB6pUfL/x2dKbdxcwjl9xP+WGvIUnDsRKY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dbH3Q6w6aiEpPwovbi8vlZceKokvAqmHYx8COmNGO0bETudxYASuFt5SpWFkhb4XZYnKNRMPbcIMehU64wk2haU9jN+ZUl/NsWuA4NjdUTkvDsq/6g9ijeWkV5IgxUIPYmFODc1FzEN2sbt8dQUdRLURuWKl7CDnP+F6qheW3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wz+J+iEP; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b715b26fc3so7747298eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 07:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133596; x=1770738396; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zUNFIGlyTHebw14PjaHRVaRleR84b5q0aNkokfkkxb0=;
        b=wz+J+iEPN91cikm3dCd5RAhYUPRTcD8hOW1W4NjhJUqiFXtk98ywTfv5hmvGoyxIkw
         5PFJTEqEymH5HhCow+3BnY7qNdAVbnVUNm9Srk5IyeJnJPwVgM04vDY2eXKSwFnZY6j0
         O6LAtV9/CpwXFGjx97gfioHg/j580nun5+5BUpt6jweUCtIYs3YiLHZFimRA+XkyzSzf
         hnY52coO7qK1qZ6d1p86sXRT5HuCoJNwA/8FB3OS3rqhDyyYtA1e8JF4J4WLRdXNiFhF
         azP2BFOKRCPEf397QUlNtGjWfJp+jAlsNz1TupK3JmHK2J96SWC9U4Nq/c3/maIShzeI
         E5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133596; x=1770738396;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUNFIGlyTHebw14PjaHRVaRleR84b5q0aNkokfkkxb0=;
        b=WVLy911Iaib7Gd0N3CKgkj454/ApNGde5m7fEbiTAie8InGH5r9vybP9vSYAoZmMFg
         +D3KD/64MEvPNJ6JZiGGO4GDbvJh268VFdCf1OUmNy5GjquXqhABiirfb9xt/a1Wnve2
         f2zPlyQdlDEK7AnWIMgdsp+xVmZNFOIqK5XS3X8wuvULXoY119/p2Vvg2d+flys/lZdb
         WL7icpXT8FaVP4pjHF5zfoVrCyScaNz9Ms7O0LxbF23aLteZKXV809n40rmdEbNW3kBz
         Bv4+FR9Wm5XnxdJzFzOjniz1nZwV0T8XKKTByRziAl47AH1ce2QkvzPfCul9G3kDeP3R
         ZVcg==
X-Forwarded-Encrypted: i=1; AJvYcCV5UdQ3sqgJvBwG6U/R6uA+32LrTc21CDnIsPo08XLVO/g+5b1BpOx2gc4PbGs6IOz23C8KsfGrZrT5E3on@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIM3msa5MdOewGW9EPU21L8/1WAwckWgU0REyHA8Tf0xOG1Uw
	aveYAly1syZi1wFuyDx3QXw3MJlicJtg73V8ZgYIMwBTp7IRCnRMJlfXFZBpS2dKHhrFzNUsrlG
	VHjNCwk6vOg==
X-Received: from dybha16.prod.google.com ([2002:a05:7301:2690:b0:2b7:9eb:9ca9])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:4308:b0:2a4:3592:c60b
 with SMTP id 5a478bee46e88-2b7c88e9464mr6592778eec.28.1770133595413; Tue, 03
 Feb 2026 07:46:35 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFUYgmkC/1WQzW7DIBCEX8XiXCIWB4N9yntUOfCzOEi1SYBYj
 SK/e4iTqu1xRjuz3+6dZEwBMxmaO0m4hBziXAX/aIg96XlEGlzVhDMugPGeXmycaI42zD5Sp1o
 lrfTOgCU1ck7ow/dW93l86YSXa20tL/O3tO74qdTOUZxLiucb9UIicDQIwIZFkL8c7wgHTkvSc
 56uBanSpmOyk4xpNSztM2B0Rloxp1CGRohe230PYs8tY8hb1XtlfbW6DgSXpjXMKc3Ik/cUcon ptn1jgQ34vbL9f/gCFKhwWksvPNdKHMYYxy/c1SFyXNf1AQLVIJRZAQAA
X-Change-Id: 20251029-qcom-socinfo-d8387c7fdb1c
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=5665;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Rx6vnHQPmCB6pUfL/x2dKbdxcwjl9xP+WGvIUnDsRKY=; b=W+lFktsf8wX1pktUN3eKTu3qtnEH/soJLai7oDKE5ECuKgleh81SH/oxM2XEYpUXOI/pa3kD8
 6wDLf05/1kgA1zblVxr0xx5mt3QFI0BfEUePrGMActt3/ZSSQcDYeaj
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Subject: [PATCH v2 0/6] soc: qcom: socinfo: Convert to Rust
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91683-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,quicinc.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,linuxfoundation.org,ffwll.ch,samsung.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaurer@google.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16863DB875
X-Rspamd-Action: no action

This series converts the Qualcomm Socinfo driver to Rust to improve its
robustness.

The previous driver suffered from CVE-2024-58007, which would have been
prevented by the enforced bounds-checking present in Rust.

It's taken a while to get all the interfaces in place, but at this
point, the only place it needs `unsafe` is to define an abstraction
over the qcom-smem driver.

Feedback on v1 of the patch showed how Rust can help to identify
assumptions being made about APIs by requiring that reasoning be
attached to `unsafe` blocks. Specifically, this identified:

1. The regions being returned by `qcom_smem_get` are not memory regions,
   they are IO mapped memory.
2. These regions will be unmapped if the `smem` device is unloaded.
3. For versions in particular, the behavior of re-reading the version
   info from the IO region when displaying outputs is load-bearing, not
   an implementation detail - these regions are *expected* to change.

The previous driver accessed IO mapped regions through regular C memory
accesses. This was possible without warning because the `qcom_smem_get` 
API exposes pointers stripped of their `__iomem` annotation. This is
unlikely to cause trouble in practice, but goes against the
recommendation of kernel documentation [1].

The previous driver did not have a direct mechanism to ensure it was
being probed as a child of a `qcom-smem` device. While it was only ever
probed correctly (from the `qcom-smem` device), the new implementation
is robust to being probed improperly by other devices.

Since we are now using the IO subsystem, it's now much clearer when we
are intentionally choosing to do an IO read during a DebugFS
implementation.

I have tested this on a SM8650-HDK by diffing the contents of the
exported DebugFS and examining the files under /sys/bus/soc/devices/soc0

While I believe I have everything correctly exported via DebugFS, I have
not checked equivalence across a large swath of devices, only the one.

This driver is currently quirk-compatible in DebugFS-exported values. If
the maintainers do not believe that maintaining the exact formats is a
benefit, we could simplify the code further by dropping some of the
custom formatting functions used to match the output.

I didn't touch MAINTAINERS because the existing socinfo.c is covered by
a blanket directory maintainer, which would automatically cover the new
Rust implementation. If it would be helpful, I would be willing to
assist with this particular driver in the future.

Since it was a surprise in the previous series, I will explicitly call
out that this series is built on driver-core-next plus my patches to
load randomness [2] and derive FromBytes / AsBytes [3]. If you use b4,
this series should have appropriate metadata to recreate the tree for
you.

[1]: https://docs.kernel.org/driver-api/device-io.html#accessing-the-device
[2]: https://lore.kernel.org/all/20260102-add-entropy-v5-1-6b38a7a4a9ee@google.com/
[3]: https://lore.kernel.org/all/20251226-transmute-v3-0-c69a81bf8621@google.com/

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
Changes in v2:
- Rebase onto updated deps
- Use sparse_array! macro to define PMIC_MODELS
- Migrate to using auxdev
- Add `qcom_smem_get_aux` to help enforce that we are a child device
- Access IO mapped regions through the IO subsystem
- Leverage `Devres` to ensure that the smem device is still present when
  accessing IO regions.
- Switch to new kernel import style
- Switch to c"foo" literals where possible
- Link to v1: https://lore.kernel.org/r/20251213-qcom-socinfo-v1-1-5daa7f5f2a85@google.com

---
Matthew Maurer (6):
      rust: Add sparse_array! helper macro
      rust: io: Support copying arrays and slices
      rust: device: Support testing devices for equality
      rust: auxiliary: Support accessing raw aux pointer
      rust: debugfs: Allow access to device in Devres-wrapped scopes
      soc: qcom: socinfo: Convert to Rust

 drivers/soc/qcom/Kconfig             |   1 +
 drivers/soc/qcom/Makefile            |   2 +-
 drivers/soc/qcom/smem.c              |  42 +-
 drivers/soc/qcom/socinfo.c           | 931 -----------------------------------
 drivers/soc/qcom/socinfo/Makefile    |   2 +
 drivers/soc/qcom/socinfo/bindings.rs | 123 +++++
 drivers/soc/qcom/socinfo/data.rs     | 438 ++++++++++++++++
 drivers/soc/qcom/socinfo/socinfo.rs  | 446 +++++++++++++++++
 include/linux/soc/qcom/smem.h        |   4 +
 rust/bindgen_parameters              |   1 +
 rust/bindings/bindings_helper.h      |   6 +
 rust/kernel/auxiliary.rs             |   6 +-
 rust/kernel/debugfs.rs               |  40 ++
 rust/kernel/device.rs                |   8 +
 rust/kernel/devres.rs                |   2 +-
 rust/kernel/drm/driver.rs            |   2 +-
 rust/kernel/io.rs                    |  72 ++-
 rust/kernel/pwm.rs                   |   2 +-
 rust/kernel/slice.rs                 |  37 ++
 19 files changed, 1220 insertions(+), 945 deletions(-)
---
base-commit: 559ac491542c00e2389f8cfc49661527b3b0d8a0
change-id: 20251029-qcom-socinfo-d8387c7fdb1c
prerequisite-change-id: 20251029-add-entropy-f57e12ebe110:v5
prerequisite-patch-id: f1e8f8f557aa3df7510bd90beb1edf62faa117da
prerequisite-change-id: 20251212-transmute-8ab6076700a8:v3
prerequisite-patch-id: 4f5f7cb002d02d232083ab5c3ce6b3cb90650bd6
prerequisite-patch-id: fcdcb6cfedd70cdc41d2d27244ea2a588ed40eb9
prerequisite-patch-id: f6bc9ae84b31e2400749c0db10e6aa4216b3858b
prerequisite-patch-id: 95a7f946b6533ec4ccafee355626bb24a9be8f70

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


