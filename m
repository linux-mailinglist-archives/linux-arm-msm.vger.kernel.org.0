Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D4B238EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2019 15:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732449AbfETNyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 May 2019 09:54:04 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:54387 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732372AbfETNyE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 May 2019 09:54:04 -0400
Received: by mail-it1-f195.google.com with SMTP id a190so22984393ite.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2019 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4j5LbYhgEMKnY68snBvOCpO79qdUQ+grRP4+9IrOwhs=;
        b=p86wF9vsShGKGUgixYkUTORMJxa4rHW8U2B8qe/L6lGwMHVSshSA9L2RRaEQBaHvZi
         ejV3/fM3HNBKSSWv+Ki6tTqzJrnhofs6FhgExBGRcZo3BD+SXMcVI+WgNHqS/ARLUPpY
         hnO5czpCXSRF+n0UhF3HpujxNSyWSsBh7GMgty+rt/DhYaKhr1+7BdvQpvxt4aq+Ugzz
         qmlxC+BZx7MF38y12539vx3VgvKw4akmUQbOuLNVJdFoCQZqZSL07hCyqGaqiNtJugED
         ChsacW8CFWky8cw8nlUE6wTa83sINciLuwhiHQdc9+eqwQ486sljn2APog+b4xx8DmID
         Dkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4j5LbYhgEMKnY68snBvOCpO79qdUQ+grRP4+9IrOwhs=;
        b=P8woDNPIY8fEQ2He4fC18nCiDpr6gXCD8xiXwLR34pCvr8DUoRZnrtPXbuUt/aTGYf
         dx6TBCXJcqfn6q5BF+u0lDQuJy4CoQM8i9dD0I6YNDmIFS0WazUVj8p0QpLEfmgjVnEs
         PNOYqoFnXupG7GFk8sW5jft6b154NfCeojxhtWBxXNQebfgdBSIgKxQRs76zWJ5pR/YD
         FzEoJRLlakXoExUm6Peeqw0s8ulmYf+sTH75DZqfu8D3xnuIJluZ4lacK59pSJtgOSAf
         buYtTjGdjDKTdQyhRPykwQM7NrHzvGq6ZOZFB+13tDWYfHhWAoQL8G60D+7xnMV3el2u
         2+Kw==
X-Gm-Message-State: APjAAAWWxqYRyxioMvLCYQa9M2Snial2cdny1anR/crdQGaHfDL+so/q
        L1pVdDPAL0GEWs6X2uC2GJKDtQ==
X-Google-Smtp-Source: APXvYqynDGYge32TFVxFhq9PSur4Re+5KQgS6ckqDWoN8hjhEqYYc4VSh706navhQ++/e9WzC9K/jw==
X-Received: by 2002:a24:218a:: with SMTP id e132mr1015517ita.77.1558360443143;
        Mon, 20 May 2019 06:54:03 -0700 (PDT)
Received: from localhost.localdomain (c-71-195-29-92.hsd1.mn.comcast.net. [71.195.29.92])
        by smtp.gmail.com with ESMTPSA id n17sm6581185ioa.0.2019.05.20.06.54.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 06:54:02 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     arnd@arndb.de, subashab@codeaurora.org, david.brown@linaro.org,
        agross@kernel.org, davem@davemloft.net
Cc:     bjorn.andersson@linaro.org, ilias.apalodimas@linaro.org,
        cpratapa@codeaurora.org, syadagir@codeaurora.org,
        evgreen@chromium.org, benchan@google.com, ejcaruso@google.com,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] net: qualcomm: rmnet: kill RMNET_MAP_GET_*() accessor macros
Date:   Mon, 20 May 2019 08:53:48 -0500
Message-Id: <20190520135354.18628-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520135354.18628-1-elder@linaro.org>
References: <20190520135354.18628-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following macros, defined in "rmnet_map.h", assume a socket
buffer is provided as an argument without any real indication this
is the case.
    RMNET_MAP_GET_MUX_ID()
    RMNET_MAP_GET_CD_BIT()
    RMNET_MAP_GET_PAD()
    RMNET_MAP_GET_CMD_START()
    RMNET_MAP_GET_LENGTH()
What they hide is pretty trivial accessing of fields in a structure,
and it's much clearer to see this if we do these accesses directly.

So rather than using these accessor macros, assign a local
variable of the map header pointer type to the socket buffer data
pointer, and derereference that pointer variable.

Use the network byte order macros (e.g., ntohs()), not the Linux
byte order functions (e.g. be_to_cpu16()) to convert the big-endian
packet length field, to match the convention used elswhere in the
driver.

There's no need to byte swap 0; it's all zeros irrespective of
endianness.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c |  9 +++++----
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h      | 12 ------------
 .../net/ethernet/qualcomm/rmnet/rmnet_map_command.c  | 11 ++++++++---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c |  4 ++--
 4 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
index 11167abe5934..4c1b62b72504 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_handlers.c
@@ -65,20 +65,21 @@ static void
 __rmnet_map_ingress_handler(struct sk_buff *skb,
 			    struct rmnet_port *port)
 {
+	struct rmnet_map_header *map_header = (void *)skb->data;
 	struct rmnet_endpoint *ep;
 	u16 len, pad;
 	u8 mux_id;
 
-	if (RMNET_MAP_GET_CD_BIT(skb)) {
+	if (map_header->cd_bit) {
 		if (port->data_format & RMNET_FLAGS_INGRESS_MAP_COMMANDS)
 			return rmnet_map_command(skb, port);
 
 		goto free_skb;
 	}
 
-	mux_id = RMNET_MAP_GET_MUX_ID(skb);
-	pad = RMNET_MAP_GET_PAD(skb);
-	len = RMNET_MAP_GET_LENGTH(skb) - pad;
+	mux_id = map_header->mux_id;
+	pad = map_header->pad_len;
+	len = ntohs(map_header->pkt_len) - pad;
 
 	if (mux_id >= RMNET_MAX_LOGICAL_EP)
 		goto free_skb;
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
index b1ae9499c0b2..a30a7b405a11 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map.h
@@ -63,18 +63,6 @@ struct rmnet_map_ul_csum_header {
 	u16 csum_enabled:1;
 } __aligned(1);
 
-#define RMNET_MAP_GET_MUX_ID(Y) (((struct rmnet_map_header *) \
-				 (Y)->data)->mux_id)
-#define RMNET_MAP_GET_CD_BIT(Y) (((struct rmnet_map_header *) \
-				(Y)->data)->cd_bit)
-#define RMNET_MAP_GET_PAD(Y) (((struct rmnet_map_header *) \
-				(Y)->data)->pad_len)
-#define RMNET_MAP_GET_CMD_START(Y) ((struct rmnet_map_control_command *) \
-				    ((Y)->data + \
-				      sizeof(struct rmnet_map_header)))
-#define RMNET_MAP_GET_LENGTH(Y) (ntohs(((struct rmnet_map_header *) \
-					(Y)->data)->pkt_len))
-
 #define RMNET_MAP_COMMAND_REQUEST     0
 #define RMNET_MAP_COMMAND_ACK         1
 #define RMNET_MAP_COMMAND_UNSUPPORTED 2
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
index f6cf59aee212..f675f47c3495 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_command.c
@@ -20,12 +20,13 @@ static u8 rmnet_map_do_flow_control(struct sk_buff *skb,
 				    struct rmnet_port *port,
 				    int enable)
 {
+	struct rmnet_map_header *map_header = (void *)skb->data;
 	struct rmnet_endpoint *ep;
 	struct net_device *vnd;
 	u8 mux_id;
 	int r;
 
-	mux_id = RMNET_MAP_GET_MUX_ID(skb);
+	mux_id = map_header->mux_id;
 
 	if (mux_id >= RMNET_MAX_LOGICAL_EP) {
 		kfree_skb(skb);
@@ -57,6 +58,7 @@ static void rmnet_map_send_ack(struct sk_buff *skb,
 			       unsigned char type,
 			       struct rmnet_port *port)
 {
+	struct rmnet_map_header *map_header = (void *)skb->data;
 	struct rmnet_map_control_command *cmd;
 	struct net_device *dev = skb->dev;
 
@@ -66,7 +68,8 @@ static void rmnet_map_send_ack(struct sk_buff *skb,
 
 	skb->protocol = htons(ETH_P_MAP);
 
-	cmd = RMNET_MAP_GET_CMD_START(skb);
+	/* Command data immediately follows the header */
+	cmd = (struct rmnet_map_control_command *)(map_header + 1);
 	cmd->cmd_type = type & 0x03;
 
 	netif_tx_lock(dev);
@@ -79,11 +82,13 @@ static void rmnet_map_send_ack(struct sk_buff *skb,
  */
 void rmnet_map_command(struct sk_buff *skb, struct rmnet_port *port)
 {
+	struct rmnet_map_header *map_header = (void *)skb->data;
 	struct rmnet_map_control_command *cmd;
 	unsigned char command_name;
 	unsigned char rc = 0;
 
-	cmd = RMNET_MAP_GET_CMD_START(skb);
+	/* Command data immediately follows the header */
+	cmd = (struct rmnet_map_control_command *)(map_header + 1);
 	command_name = cmd->command_name;
 
 	switch (command_name) {
diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index 57a9c314a665..498f20ba1826 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -323,7 +323,7 @@ struct sk_buff *rmnet_map_deaggregate(struct sk_buff *skb,
 		return NULL;
 
 	maph = (struct rmnet_map_header *)skb->data;
-	packet_len = ntohs(maph->pkt_len) + sizeof(struct rmnet_map_header);
+	packet_len = ntohs(maph->pkt_len) + sizeof(*maph);
 
 	if (port->data_format & RMNET_FLAGS_INGRESS_MAP_CKSUMV4)
 		packet_len += sizeof(struct rmnet_map_dl_csum_trailer);
@@ -332,7 +332,7 @@ struct sk_buff *rmnet_map_deaggregate(struct sk_buff *skb,
 		return NULL;
 
 	/* Some hardware can send us empty frames. Catch them */
-	if (ntohs(maph->pkt_len) == 0)
+	if (!maph->pkt_len)
 		return NULL;
 
 	skbn = alloc_skb(packet_len + RMNET_MAP_DEAGGR_SPACING, GFP_ATOMIC);
-- 
2.20.1

