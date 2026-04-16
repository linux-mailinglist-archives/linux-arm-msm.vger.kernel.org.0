Return-Path: <linux-arm-msm+bounces-103460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMgsOO5l4WlyswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:42:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB341550A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 026233075869
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 22:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2059C38C2D8;
	Thu, 16 Apr 2026 22:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="i4v37xbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5206D378D96;
	Thu, 16 Apr 2026 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776379276; cv=none; b=XMy8X+bhQm1fZMtNcECM9Tb0U9pmCyyPv2LEjfVedMEItITfCx8XaaBvpPbeIExcqd5o6mKGz3vlFYhizVzCeSoWeOF71RrdBlWeg6/zSIDyEp3FlFxDcpOznY9Cx8RWMKYXm4FS5zdCb7nLpSFAIFV39IEU9rQ9ESDe4vDxPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776379276; c=relaxed/simple;
	bh=260oGQfUQWy6ynSqaYtEHX4o2NfRoz579B4CSFDiSCQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HwSwZjc3eErBzJNnnEgc9/mus+l+HU3I8m0lobLmWj9v0U7R1tzZb2OGdxxxkWFcxIaluUaOvzaUXSfDoNukoliWNGXTjP442/gJ9CBDFD47eYhj7ViIfc8EdNA81YGl+cN+sFL5rw82wUNs7DJtz9If0V4GmeVL6JPS7fSVLok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=i4v37xbS; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776379272; x=1776638472;
	bh=YMD9aiL/OZgKx/qIxHyMNMf04F5H2aprq44qLV9B2WM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i4v37xbShw6TU+bUDpQHNQoqFi7NayOug+nfWkQXORsoczlYoGGxHuLWtGBXLRFvo
	 qek+u4+C/Wi7YxkUbn3vNaxwYY6nnUGDabw9tHS520k2Ub/fdjnPZvMXAnmPt12Elh
	 DpaaiGHHe01QsHViPA3azAS+xm2KpjidXHe7184BQ6JstwdZ/laqwWR4oXgg0z/YO4
	 cIFyFl/y5KklXsQ4FZSKafvZ5iIYgBdovL7MfY84+IaIaGyt27Rxe7X35Nx7Vo11GT
	 7OSzvJ8ZSk+VMG3NMmfCBG+n92MM01DdFEG0ZuiYzrnfGWey1FoyBdFAdy52GQjNZJ
	 0YDwu8/UbuYxA==
Date: Thu, 16 Apr 2026 22:41:03 +0000
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 3/4] net: ipa: add new QMI request for HW filter stats info
Message-ID: <20260416-eliza-ipa-v1-3-f4109a8e43c4@pm.me>
In-Reply-To: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
References: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9f430e3d3750ae660e8b53644727ed970a1aac89
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103460-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 50EB341550A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some IPA firmware versions on IPA 5.5 require ipa_filter_stats_info in
the init_modem_driver QMI request. For example on Eliza, if this is not
passed then shortly after IPA init the system will halt and reboot
shortly after.

Downstream this is marked as optional but does not seem to be the case
on newer IPA firmware versions.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/net/ipa/data/ipa_data-v4.5.c |  1 +
 drivers/net/ipa/data/ipa_data-v4.7.c |  1 +
 drivers/net/ipa/data/ipa_data-v4.9.c |  1 +
 drivers/net/ipa/data/ipa_data-v5.0.c |  1 +
 drivers/net/ipa/data/ipa_data-v5.5.c |  1 +
 drivers/net/ipa/ipa.h                |  3 ++
 drivers/net/ipa/ipa_data.h           |  3 ++
 drivers/net/ipa/ipa_mem.c            |  2 ++
 drivers/net/ipa/ipa_qmi.c            | 18 +++++++++++
 drivers/net/ipa/ipa_qmi_msg.c        | 58 ++++++++++++++++++++++++++++++++=
++++
 drivers/net/ipa/ipa_qmi_msg.h        | 15 +++++++++-
 11 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ipa/data/ipa_data-v4.5.c b/drivers/net/ipa/data/ip=
a_data-v4.5.c
index 730d8c43a45c..25eceffdd9f7 100644
--- a/drivers/net/ipa/data/ipa_data-v4.5.c
+++ b/drivers/net/ipa/data/ipa_data-v4.5.c
@@ -419,6 +419,7 @@ static const struct ipa_mem_data ipa_mem_data =3D {
 =09.imem_addr=09=3D 0x14688000,
 =09.imem_size=09=3D 0x00003000,
 =09.smem_size=09=3D 0x00009000,
+=09.fnr_idx_cnt=09=3D 52,
 };
=20
 /* Interconnect rates are in 1000 byte/second units */
diff --git a/drivers/net/ipa/data/ipa_data-v4.7.c b/drivers/net/ipa/data/ip=
a_data-v4.7.c
index 5e1d9049c62b..ef4695ee1b2d 100644
--- a/drivers/net/ipa/data/ipa_data-v4.7.c
+++ b/drivers/net/ipa/data/ipa_data-v4.7.c
@@ -361,6 +361,7 @@ static const struct ipa_mem_data ipa_mem_data =3D {
 =09.imem_addr=09=3D 0x146a8000,
 =09.imem_size=09=3D 0x00002000,
 =09.smem_size=09=3D 0x00009000,
+=09.fnr_idx_cnt=09=3D 52,
 };
=20
 /* Interconnect rates are in 1000 byte/second units */
diff --git a/drivers/net/ipa/data/ipa_data-v4.9.c b/drivers/net/ipa/data/ip=
a_data-v4.9.c
index da472a2a2e29..0e2e521d98bb 100644
--- a/drivers/net/ipa/data/ipa_data-v4.9.c
+++ b/drivers/net/ipa/data/ipa_data-v4.9.c
@@ -417,6 +417,7 @@ static const struct ipa_mem_data ipa_mem_data =3D {
 =09.imem_addr=09=3D 0x146bd000,
 =09.imem_size=09=3D 0x00002000,
 =09.smem_size=09=3D 0x00009000,
+=09.fnr_idx_cnt=09=3D 52,
 };
=20
 /* Interconnect rates are in 1000 byte/second units */
diff --git a/drivers/net/ipa/data/ipa_data-v5.0.c b/drivers/net/ipa/data/ip=
a_data-v5.0.c
index bc5722e4b053..9f7aaf37b8fd 100644
--- a/drivers/net/ipa/data/ipa_data-v5.0.c
+++ b/drivers/net/ipa/data/ipa_data-v5.0.c
@@ -443,6 +443,7 @@ static const struct ipa_mem_data ipa_mem_data =3D {
 =09.imem_addr=09=3D 0x14688000,
 =09.imem_size=09=3D 0x00003000,
 =09.smem_size=09=3D 0x00009000,
+=09.fnr_idx_cnt    =3D 52,
 };
=20
 /* Interconnect rates are in 1000 byte/second units */
diff --git a/drivers/net/ipa/data/ipa_data-v5.5.c b/drivers/net/ipa/data/ip=
a_data-v5.5.c
index f6ba3b944700..44a9df7346b7 100644
--- a/drivers/net/ipa/data/ipa_data-v5.5.c
+++ b/drivers/net/ipa/data/ipa_data-v5.5.c
@@ -449,6 +449,7 @@ static const struct ipa_mem_data ipa_mem_data =3D {
 =09.imem_addr=09=3D 0x14688000,
 =09.imem_size=09=3D 0x00002000,
 =09.smem_size=09=3D 0x0000b000,
+=09.fnr_idx_cnt=09=3D 52,
 };
=20
 /* Interconnect rates are in 1000 byte/second units */
diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
index 7ef10a4ff35e..d2ceaea31635 100644
--- a/drivers/net/ipa/ipa.h
+++ b/drivers/net/ipa/ipa.h
@@ -69,6 +69,7 @@ struct ipa_smp2p;
  * @modem_state:=09State of modem (stopped, running)
  * @modem_netdev:=09Network device structure used for modem
  * @qmi:=09=09QMI information
+ * @fnr_idx_cnt:=09Number of FnR counters
  */
 struct ipa {
 =09struct gsi gsi;
@@ -129,6 +130,8 @@ struct ipa {
 =09atomic_t modem_state;=09=09/* enum ipa_modem_state */
 =09struct net_device *modem_netdev;
 =09struct ipa_qmi qmi;
+
+=09u8 fnr_idx_cnt;
 };
=20
 /**
diff --git a/drivers/net/ipa/ipa_data.h b/drivers/net/ipa/ipa_data.h
index 3eb9dc2ce339..f7566c8edabd 100644
--- a/drivers/net/ipa/ipa_data.h
+++ b/drivers/net/ipa/ipa_data.h
@@ -181,6 +181,7 @@ struct ipa_resource_data {
  * @imem_addr:=09=09physical address of IPA region within IMEM
  * @imem_size:=09=09size in bytes of IPA IMEM region
  * @smem_size:=09=09size in bytes of the IPA SMEM region
+ * @fnr_idx_cnt:=09Number of FnR counters
  */
 struct ipa_mem_data {
 =09u32 local_count;
@@ -193,6 +194,8 @@ struct ipa_mem_data {
 =09u32 imem_size; /* DEPRECATED */
=20
 =09u32 smem_size;
+
+=09u8 fnr_idx_cnt;
 };
=20
 /**
diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 078d32a18dbf..fb04f953bf7a 100644
--- a/drivers/net/ipa/ipa_mem.c
+++ b/drivers/net/ipa/ipa_mem.c
@@ -631,6 +631,8 @@ int ipa_mem_init(struct ipa *ipa, struct platform_devic=
e *pdev,
 =09ipa->mem_count =3D mem_data->local_count;
 =09ipa->mem =3D mem_data->local;
=20
+=09ipa->fnr_idx_cnt =3D mem_data->fnr_idx_cnt;
+
 =09/* Check the route and filter table memory regions */
 =09if (!ipa_table_mem_valid(ipa, false))
 =09=09return -EINVAL;
diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..a5a5572c9ccd 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -74,6 +74,8 @@
 #define IPA_MODEM_SERVICE_INS_ID=092
 #define IPA_MODEM_SVC_VERS=09=091
=20
+#define IPA_MODEM_FNR_IDX_START=09=09128
+
 #define QMI_INIT_DRIVER_TIMEOUT=09=0960000=09/* A minute in milliseconds *=
/
=20
 /* Send an INIT_COMPLETE indication message to the modem */
@@ -394,6 +396,22 @@ init_modem_driver_req(struct ipa_qmi *ipa_qmi)
 =09=09}
 =09}
=20
+=09if (ipa->version >=3D IPA_VERSION_4_5 && ipa->fnr_idx_cnt) {
+=09=09mem =3D ipa_mem_find(ipa, IPA_MEM_STATS_FILTER_ROUTE);
+=09=09if (mem && mem->size) {
+=09=09=09req.hw_stats_filter_info_valid =3D 1;
+=09=09=09req.hw_stats_filter_info.start_addr =3D
+=09=09=09=09ipa->mem_offset + mem->offset;
+=09=09=09req.hw_stats_filter_info.size =3D
+=09=09=09=09ipa->fnr_idx_cnt * 16;
+=09=09=09req.hw_stats_filter_info.start_index =3D
+=09=09=09=09IPA_MODEM_FNR_IDX_START;
+=09=09=09req.hw_stats_filter_info.end_index =3D
+=09=09=09=09IPA_MODEM_FNR_IDX_START +
+=09=09=09=09ipa->fnr_idx_cnt - 1;
+=09=09}
+=09}
+
 =09return &req;
 }
=20
diff --git a/drivers/net/ipa/ipa_qmi_msg.c b/drivers/net/ipa/ipa_qmi_msg.c
index 51dc13a577a5..160c0d207691 100644
--- a/drivers/net/ipa/ipa_qmi_msg.c
+++ b/drivers/net/ipa/ipa_qmi_msg.c
@@ -250,6 +250,43 @@ const struct qmi_elem_info ipa_mem_range_ei[] =3D {
 =09},
 };
=20
+/* QMI message structure definition for struct ipa_stats_filter */
+const struct qmi_elem_info ipa_stats_filter_ei[] =3D {
+=09{
+=09=09.data_type=09=3D QMI_UNSIGNED_4_BYTE,
+=09=09.elem_len=09=3D 1,
+=09=09.elem_size=09=3D
+=09=09=09sizeof_field(struct ipa_stats_filter, start_addr),
+=09=09.offset=09=09=3D offsetof(struct ipa_stats_filter,
+=09=09=09=09=09   start_addr),
+=09},
+=09{
+=09=09.data_type=09=3D QMI_UNSIGNED_4_BYTE,
+=09=09.elem_len=09=3D 1,
+=09=09.elem_size=09=3D
+=09=09=09sizeof_field(struct ipa_stats_filter, size),
+=09=09.offset=09=09=3D offsetof(struct ipa_stats_filter, size),
+=09},
+=09{
+=09=09.data_type=09=3D QMI_UNSIGNED_1_BYTE,
+=09=09.elem_len=09=3D 1,
+=09=09.elem_size=09=3D
+=09=09=09sizeof_field(struct ipa_stats_filter, start_index),
+=09=09.offset=09=09=3D offsetof(struct ipa_stats_filter,
+=09=09=09=09=09   start_index),
+=09},
+=09{
+=09=09.data_type=09=3D QMI_UNSIGNED_1_BYTE,
+=09=09.elem_len=09=3D 1,
+=09=09.elem_size=09=3D
+=09=09=09sizeof_field(struct ipa_stats_filter, end_index),
+=09=09.offset=09=09=3D offsetof(struct ipa_stats_filter, end_index),
+=09},
+=09{
+=09=09.data_type=09=3D QMI_EOTI,
+=09},
+};
+
 /* QMI message structure definition for struct ipa_init_modem_driver_req *=
/
 const struct qmi_elem_info ipa_init_modem_driver_req_ei[] =3D {
 =09{
@@ -640,6 +677,27 @@ const struct qmi_elem_info ipa_init_modem_driver_req_e=
i[] =3D {
 =09=09.offset=09=09=3D offsetof(struct ipa_init_modem_driver_req,
 =09=09=09=09=09   hw_stats_drop_size),
 =09},
+=09{
+=09=09.data_type=09=3D QMI_OPT_FLAG,
+=09=09.elem_len=09=3D 1,
+=09=09.elem_size=09=3D
+=09=09=09sizeof_field(struct ipa_init_modem_driver_req,
+=09=09=09=09     hw_stats_filter_info_valid),
+=09=09.tlv_type=09=3D 0x23,
+=09=09.offset=09=09=3D offsetof(struct ipa_init_modem_driver_req,
+=09=09=09=09=09   hw_stats_filter_info_valid),
+=09},
+=09{
+=09=09.data_type=09=3D QMI_STRUCT,
+=09=09.elem_len=09=3D 1,
+=09=09.elem_size=09=3D
+=09=09=09sizeof_field(struct ipa_init_modem_driver_req,
+=09=09=09=09     hw_stats_filter_info),
+=09=09.tlv_type=09=3D 0x23,
+=09=09.offset=09=09=3D offsetof(struct ipa_init_modem_driver_req,
+=09=09=09=09=09   hw_stats_filter_info),
+=09=09.ei_array=09=3D ipa_stats_filter_ei,
+=09},
 =09{
 =09=09.data_type=09=3D QMI_EOTI,
 =09},
diff --git a/drivers/net/ipa/ipa_qmi_msg.h b/drivers/net/ipa/ipa_qmi_msg.h
index 644b8c27108b..3a2205c213d1 100644
--- a/drivers/net/ipa/ipa_qmi_msg.h
+++ b/drivers/net/ipa/ipa_qmi_msg.h
@@ -27,7 +27,7 @@
  */
 #define IPA_QMI_INDICATION_REGISTER_REQ_SZ=0920=09/* -> server handle */
 #define IPA_QMI_INDICATION_REGISTER_RSP_SZ=097=09/* <- server handle */
-#define IPA_QMI_INIT_DRIVER_REQ_SZ=09=09162=09/* client handle -> */
+#define IPA_QMI_INIT_DRIVER_REQ_SZ=09=09186=09/* client handle -> */
 #define IPA_QMI_INIT_DRIVER_RSP_SZ=09=0925=09/* client handle <- */
 #define IPA_QMI_INIT_COMPLETE_IND_SZ=09=097=09/* <- server handle */
 #define IPA_QMI_DRIVER_INIT_COMPLETE_REQ_SZ=094=09/* -> server handle */
@@ -119,6 +119,13 @@ struct ipa_mem_range {
 =09u32 size;
 };
=20
+struct ipa_stats_filter {
+=09u32 start_addr;
+=09u32 size;
+=09u8 start_index;
+=09u8 end_index;
+};
+
 /* The message for the IPA_QMI_INIT_DRIVER request contains information
  * from the AP that affects modem initialization.
  */
@@ -216,6 +223,11 @@ struct ipa_init_modem_driver_req {
 =09u32=09=09=09hw_stats_drop_base_addr;
 =09u8=09=09=09hw_stats_drop_size_valid;
 =09u32=09=09=09hw_stats_drop_size;
+
+=09/* Hardware filter statistics information. (IPA v4.5 and above)
+=09 */
+=09u8=09=09=09hw_stats_filter_info_valid;
+=09struct ipa_stats_filter=09hw_stats_filter_info;
 };
=20
 /* The response to a IPA_QMI_INIT_DRIVER request begins with a standard
@@ -256,6 +268,7 @@ extern const struct qmi_elem_info ipa_init_complete_ind=
_ei[];
 extern const struct qmi_elem_info ipa_mem_bounds_ei[];
 extern const struct qmi_elem_info ipa_mem_array_ei[];
 extern const struct qmi_elem_info ipa_mem_range_ei[];
+extern const struct qmi_elem_info ipa_stats_filter_ei[];
 extern const struct qmi_elem_info ipa_init_modem_driver_req_ei[];
 extern const struct qmi_elem_info ipa_init_modem_driver_rsp_ei[];
=20

--=20
2.53.0



