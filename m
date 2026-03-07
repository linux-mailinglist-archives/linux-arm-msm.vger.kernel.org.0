Return-Path: <linux-arm-msm+bounces-95965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCZ0KiUPrGkbjgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:42:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AD222B7D3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58D583019809
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6908C34DB7C;
	Sat,  7 Mar 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HCbuUvWp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Spgc5YjO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7338E356A3C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883728; cv=none; b=dXp/B6UNLrT7EqlzETQhilldALS4WvqlWsiObLULamkCMEd7cwBx5GHsO0HzZfBm72jZhmGMI1gjLEipJEKDkYqzxsCkAyyKokaLj6eSlFc0uccpZeBYrzrU+l583hfmMIijzfv7s7un/ZFZ3gaxvMCPjq+RFfmdOfzKu/hlPHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883728; c=relaxed/simple;
	bh=1D00kesAnJ6aiS/h94SYG7huQNLbnZVj76ipx20EKSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKFJrlnnIWC9PA6Hn37LZ7DBw6D/eCCnt52aPyPT9eoVQYKZew8Xlok9gsw0xU5LNVDISS4jtQ4gRKDO9hKFJRn4wYPU4IiP2ivDE3YvP7AnyMpEukJqkCThlt9X5QXpdTpp/MoeTFV+Rh5BkCtRJ3bzib1rIfnuHQVmzEduIbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HCbuUvWp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Spgc5YjO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qsqI2485259
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2juIOgJkND7DShqV2RiQUTSq3Zx05rOAfNWgAcwjbTU=; b=HCbuUvWphECja8SU
	A2kDK6WliHtoRZfXWqc/zR0oQBdGVDY4QfQRcJF9yhkzjTsAr4AyQtdFNRDbSYPt
	erGoty491laljVXwtIspmp9SAlNmr9Vhqe6Ig6i2N60j4tirv7g7RyvAhPa+87AL
	4EHmbuNvHZoI8feNKXd58UaUDEEO+bhieAOcAmNxqnXn13CDXL4evGCLL1mNIBL6
	qa+T6JJgCeumAeRBU+RAy9c7nMwzf+CKBwMMI5a13pyi+MioLxYxZSyxRoBF/bYP
	euWCNM4cAkcQaBBGhTP01duXXuT+R5YyP8Xh/L66J4bgqQZp7p2AcOOJuXgM04xH
	3RHL1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc838pnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:42:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4a6bb316so67186575ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883724; x=1773488524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2juIOgJkND7DShqV2RiQUTSq3Zx05rOAfNWgAcwjbTU=;
        b=Spgc5YjO1i0IArG2qvbHpjS8+IPsPSCPM6d8v/0zQurZvtdma2E6rGgDF/iE14SIwO
         fdiZ+xIkxhgm6Dj4GET1CTb5gAuyhP1KGfX3OGJAFkoKusZpuPFMG/pue3iCJkuCrTrl
         dSketh0SYox/okgcNqB7dTHbrfStb5sRoFrHXvBXidcYhotA4yogULNO4jMqjKXgjLMS
         nKTrxkHRtTE0q04OlA7s7XuUdjbOx/iMrrSN7kOtPmpCqLbfA1tq8pyJ+ifl2Wo/3R1K
         GAg1OXlETBjo+g2kLqZC8rx77m1StvAG1LsoKtn+iZVTo/3bhSYod5EdoXmdBRqiKMmA
         kmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883724; x=1773488524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2juIOgJkND7DShqV2RiQUTSq3Zx05rOAfNWgAcwjbTU=;
        b=YJnYnNx6IUWjDSO1/vKE9bzmfoZm0P5fKcuzJBj486IFCG0DNoXNbCIRVj6+dCrcz9
         37kPKRXX8Y63jXo0qID0T80gsKe5tsW+8FEgg0uD1SecqqBWz0X0FWx8GmjHVTioz977
         Ve7sf6ZfSm2ZdB3z7Da8AA38lxXYR8ev5d+cm5GjWRqw1smg/KJDrTxs1CIW8lwKY8F5
         Yl7f8faadGvhfs1duuQoeIefW4I1TCOYaQ/1G0eOmapFP4ah/ztO72GDxVkokdrQ0eQU
         yPiBO03D6/Kkatl7jvyPyboeYau7MwP971ENl4SS3OqTzgH5qyCJrkR6vXxSfueu45yO
         v6Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXOZqSu7fZ08F38SmtUUgVRivuGkY5/UgfNDUjO8SMQGQ6UUIKlFHen73cs7003ka0WJ75hHk5QFkolBY3g@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVZ7RT+k1LNgwuVwNYZB/it/2dWU9jrx+TLbKUeybY+lLdRCT
	+NsqabZQa0t3ttDcfqecF0uuffMTr8K6QIGfwqFQZVBpYtNNP1/7mPBmF4/5IWhxDYWhltWuPmR
	vt4hsy8okBIn6HpAtZ5cpuOvPgU4H8TOULrrRPTQZGbfID0Gz17lGAvAUtxB6i8oI7M+s
X-Gm-Gg: ATEYQzyovL9zveIZkHGAXN4P/7nc12ZVxuY0u1CQBaIfMg/1JzRecDghbB1r4Qp4Qqe
	IaKYzoMAUp5ii3QiXwTPmsqIAu+ZKAKvm3NhZHorXb2EjsQ7aTAfzi/O/c+eB+tgGMdUkynTMKk
	ZS9P0oMpuTeSXGgbn1FCc4VywKvgj/0WNe8vqG+nwHiUxtsjKi7WhwC4ppBClz4NWj4mxbVHR23
	2gyEfM9SODOSit8y8aX+f6O/H1z2SJ7/EpHfexyKfTfu8uuLpq6j4zLHFMiyOMIjgwDpc2RHZ+s
	hfrppL96hbD2MjsbPchc5VXHZUFLuUx1H231YHazCP/8n6mVid1j4cdCHccjjyGAdlHcrNJfJx9
	vTLFotZp+UXGaNEftQcVpSCFC6PdkXTjWrjsKGisCIjCcvzkn8+g=
X-Received: by 2002:a17:902:c94a:b0:2ae:698d:94a6 with SMTP id d9443c01a7336-2ae8241dd3dmr63851885ad.2.1772883723050;
        Sat, 07 Mar 2026 03:42:03 -0800 (PST)
X-Received: by 2002:a17:902:c94a:b0:2ae:698d:94a6 with SMTP id d9443c01a7336-2ae8241dd3dmr63851565ad.2.1772883721960;
        Sat, 07 Mar 2026 03:42:01 -0800 (PST)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8c713sm47996145ad.66.2026.03.07.03.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:42:01 -0800 (PST)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Sat, 07 Mar 2026 17:11:22 +0530
Subject: [PATCH v2 1/9] Add documentation for Sahara protocol.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-sahara_protocol_new_v2-v2-1-29dc748b5e9c@oss.qualcomm.com>
References: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
In-Reply-To: <20260307-sahara_protocol_new_v2-v2-0-29dc748b5e9c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772883713; l=70694;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=1D00kesAnJ6aiS/h94SYG7huQNLbnZVj76ipx20EKSA=;
 b=URyimUciCklENLJ+pQubefFO/8T814YeNmTzuI8rnlej/SHAIUIT8CfC5TltM3zWHf5UlGYON
 tOypjDrWRLZCo3JhmjZJ8gszowYXyAzojWehIkcDeeDS/bdPgnT6u23
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ac0f0c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MMUwo3wwYuTaqRZ-dQsA:9 a=t_MdwZQk9VBQcGG5:21
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX1DcVkuMoWkz6
 w6D0Gckam0Ddae4qvefJNUzcngK4aw5s2/AeyUo7Y9BslY6GBrWEeukXmMlK3NRH/CwR1+FJQN0
 ocFLjCDaD/ce4KUYz77uqIqNjs/LfsR73kv2/hvhaqJECvIPp7V/LQ6QrsO/ewpsmP8oGKXkLP9
 51N771EpKvEV6vV89ymGaGlb+9H/40pvN83PXTBOIGq3FHvWN9Y3xZHl5sREF/K03rbUk4rweHO
 gl39I6OuGjHm80IGJGaXEAbew5fztl8yIsfQIz+I0NK2EEcfNAmeD47LXwNe/CgZrTDmDkwr4UM
 0OIjJjxZpdiFYzMRmBXxqtgGpt29yGRh+u7s7RtyNLW+m8Re6vHxquKTyBptA01ijiU/xTjBQu2
 /0WJ+8tqnAGz/SDxDKAoARzKyjfbXTZYlW4U1cpEDy6rfsLtcJNI947ImARXUykGzbN6RN4XsUv
 Y/YyqyF4xAMIrbugLEg==
X-Proofpoint-ORIG-GUID: UYOrqqJ9sN-P-5TBbLZmS_JNOiNNkGCq
X-Proofpoint-GUID: UYOrqqJ9sN-P-5TBbLZmS_JNOiNNkGCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
X-Rspamd-Queue-Id: 04AD222B7D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-95965-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Introduce documentation for the Sahara protocol, describing its
operational modes and their respective functions. The image transfer mode
enables firmware transfer from host to device. The memory debug mode
allows extraction of device memory contents to host. The command mode
facilitates retrieval of DDR training data from the device and also
to restore the training data back to device in subsequent boot of device
to save boot time.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 Documentation/sahara/index.rst           |   14 +
 Documentation/sahara/sahara_protocol.rst | 1241 ++++++++++++++++++++++++++++++
 2 files changed, 1255 insertions(+)

diff --git a/Documentation/sahara/index.rst b/Documentation/sahara/index.rst
new file mode 100644
index 0000000000000000000000000000000000000000..073002c15a203344524e258b2aa0a6ce839e064b
--- /dev/null
+++ b/Documentation/sahara/index.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+========================
+Qualcomm Sahara protocol
+========================
+
+The Sahara protocol transfers data to and from memory and describes packet
+structures, packet flows, and their usage.
+
+.. toctree::
+   :maxdepth: 2
+   :caption: Contents
+
+   sahara_protocol
diff --git a/Documentation/sahara/sahara_protocol.rst b/Documentation/sahara/sahara_protocol.rst
new file mode 100644
index 0000000000000000000000000000000000000000..91204bb7d170be4fc4c85f142b8f0b93d3c421a0
--- /dev/null
+++ b/Documentation/sahara/sahara_protocol.rst
@@ -0,0 +1,1241 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+
+=============================
+Sahara protocol Specification
+=============================
+
+The Qualcomm Sahara protocol driver is primarily designed for transferring
+software images from a host device to a target device using a simplified data
+transfer mechanism over a link. However, the sahara protocol does not support
+any authentication/validation of the data sent between devices. Such a mechanism
+is beyond the scope of the protocol.
+
+The Sahara protocol defines two types of packets - Command packet and Data
+packet.
+
+Command packet
+--------------
+  These packets are sent between the host and the target to setup transfers of
+  data packets. The command packets contain a command ID and packet length.
+  Depending on the command, the packet may contain additional command specific
+  field.
+
++-------------+---------------+----------------+----------------+
+| Command ID  | Packet length | Optional field | Optional field |
++-------------+---------------+----------------+----------------+
+
+Data packet
+-----------
+  The data packets contain RAW data as shown below.
+
++---------------------------------------------------------+
+|           RAW Data (arbitrary number of bytes)          |
++---------------------------------------------------------+
+
+Command packet optional fields
+------------------------------
+
++---------+---------------+---------+-----------------------------------------+
+| ID val  |     Field     | Sent by |             Description                 |
++---------+---------------+---------+-----------------------------------------+
+|   0x0   |       -       |    -    |             Invalid                     |
++---------+---------------+---------+-----------------------------------------+
+|   0x1   | Hello packet  |  Target | Initializes connection and protocol     |
++---------+---------------+---------+-----------------------------------------+
+|   0x2   | Hello response|  Host   | Acknowledges connection and protocol    |
+|         |               |         | sent by target. Also used to set mode of|
+|         |               |         | operation for target to execute.        |
++---------+---------------+---------+-----------------------------------------+
+|   0x3   | Read data     |  Target | Reads specified number of bytes from    |
+|         |               |         | host for a given image.                 |
++---------+---------------+---------+-----------------------------------------+
+|   0x4   | End of image  |  Target | Indicates host that the single image tx |
+|         | transfer      |         | is complete. Also used to indicate a    |
+|         |               |         | target failure during an image transfer |
++---------+---------------+---------+-----------------------------------------+
+|   0x5   | Done packet   |  Host   | Sends acknowledgment from host that a   |
+|         |               |         | single image transfer is complete.      |
++---------+---------------+---------+-----------------------------------------+
+|   0x6   | Done response |  Target | Provides the following information to   |
+|         |               |         | host.                                   |
+|         |               |         | 1. Target is exiting protocol           |
+|         |               |         | 2. Whether the target expects to        |
+|         |               |         | re-enter protocol to transfer another   |
+|         |               |         | image.                                  |
++---------+---------------+---------+-----------------------------------------+
+|   0x7   | Reset packet  |  Host   | Instructs target to perform a reset.    |
++---------+---------------+---------+-----------------------------------------+
+|   0x8   | Reset response|  Target | Indicates host that target is about to  |
+|         |               |         | reset.                                  |
++---------+---------------+---------+-----------------------------------------+
+|   0x9   | Memory debug  |  Target | Indicates host that target has entered  |
+|         | packet        |         | a debug mode where it is ready to       |
+|         |               |         | transfer its system memory contents     |
++---------+---------------+---------+-----------------------------------------+
+|   0xA   | Memory read   |  Host   | Reads specified number of bytes from    |
+|         | packet        |         | target's system memory, starting from a |
+|         |               |         | specified address.                      |
++---------+---------------+---------+-----------------------------------------+
+|   0xB   | Command ready |  Target | Indicates host that target is ready to  |
+|         | packet        |         | receive client commands.                |
++---------+---------------+---------+-----------------------------------------+
+|   0xC   | Command switch|  Host   | Indicates target to switch modes.       |
+|         | mode packet   |         | 1. Image transfer pending mode.         |
+|         |               |         | 2. Image transfer complete mode.        |
+|         |               |         | 3. Memory debug mode.                   |
+|         |               |         | 4. Command mode.                        |
++---------+---------------+---------+-----------------------------------------+
+|   0xD   | Command       |  Host   | Indicates target to execute a given     |
+|         | execute packet|         | client command.                         |
++---------+---------------+---------+-----------------------------------------+
+|   0xE   | Command       |  Target | Indicates host that target has executed |
+|         | execute       |         | client command. Also used to indicate   |
+|         | response      |         | status of executed command.             |
+|         | packet        |         |                                         |
++---------+---------------+---------+-----------------------------------------+
+|   0xF   | Command       |  Host   | Indicates target that host is ready to  |
+|         | execute       |         | receive data resulting from executing   |
+|         | data          |         | previous client command.                |
+|         | packet        |         |                                         |
++---------+---------------+---------+-----------------------------------------+
+|   0x10  | 64 bit Memory |  Target | Indicates host that target has entered  |
+|         | debug packet  |         | a debug mode where it is ready to       |
+|         |               |         | transfer its 64 bit system memory       |
+|         |               |         | contents.                               |
++---------+---------------+---------+-----------------------------------------+
+|   0x11  | 64 bit Memory |  Host   | Reads specified number of bytes from    |
+|         | read packet   |         | target's system memory, starting from a |
+|         |               |         | 64 bit specified address.               |
++---------+---------------+---------+-----------------------------------------+
+|   0x12  | 64 bit Read   |  Target | Reads specified number of bytes from    |
+|         | data          |         | host for a given 64 bit image.          |
++---------+---------------+---------+-----------------------------------------+
+|   0x13  | Reset sahara  |  Host   | Resets Sahara state machine and enters  |
+|         | sate machine  |         | Sahara entry without target reset       |
+|         | packet        |         |                                         |
++---------+---------------+---------+-----------------------------------------+
+|   0x14  | Write data    |  Target | Writes specified number of bytes to host|
+|         | packet        |         | for a given image                       |
++---------+---------------+---------+-----------------------------------------+
+|  Others |       -       |    -    |             Invalid                     |
++---------+---------------+---------+-----------------------------------------+
+
+
+Hello Packet
+------------
+
+The hello packet is the first packet that the target sends to the host. If the
+host receives any other packet, it sends a reset command to the target. When the
+host receives a valid hello packet, it first verifies that the protocol running
+on the target is compatible with the protocol running on the host. If the
+protocol mismatch, the host sends a reset command to the target. The target uses
+the following format while sending a hello packet.
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Version   |     4       | Version number of this protocol      |
++-----------+-------------+--------------------------------------+
+| Version   |     4       | Lowest Compatible version            |
+| Compatible|             |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       | Maximum command packet length        |
+| packet    |             | (in bytes) the protocol supports.    |
+| length    |             |                                      |
++-----------+-------------+--------------------------------------+
+| Mode      |     4       | Expected mode of target operation    |
++-----------+-------------+--------------------------------------+
+| Reserved  |     4       | Reserved for future use.             |
++-----------+-------------+--------------------------------------+
+| Reserved  |     4       | Reserved for future use.             |
++-----------+-------------+--------------------------------------+
+| Reserved  |     4       | Reserved for future use.             |
++-----------+-------------+--------------------------------------+
+| Reserved  |     4       | Reserved for future use.             |
++-----------+-------------+--------------------------------------+
+| Reserved  |     4       | Reserved for future use.             |
++-----------+-------------+--------------------------------------+
+| Reserved  |     4       | Reserved for future use.             |
++-----------+-------------+--------------------------------------+
+
+The target also sends the following information:
+  1. Maximum length of the command packet that it supports. The host uses this
+     information to avoid sending more bytes than the target can support in the
+     receiving command buffer.
+  2. Mode of operation it expects to enter, based on the boot up sequence. The
+     supported modes of operation for the target are as follows:
+
++-----------------------------+---------+------------------------------------+
+|          Mode               | Mode ID |         Description                |
++-----------------------------+---------+------------------------------------+
+| SAHARA_MODE_IMAGE_TX_PENDING|  0x0    | Image transfer is in the pending   |
+|                             |         | mode. Transfer image from the host.|
+|                             |         | After completion, the host should  |
+|                             |         | expect another image transfer      |
+|                             |         | request.                           |
++-----------------------------+---------+------------------------------------+
+|SAHARA_MODE_IMAGE_TX_COMPLETE|  0x1    | Image transfer is in the complete  |
+|                             |         | mode. Transfer image from the host.|
+|                             |         | After completion, the host should  |
+|                             |         | not expect another image transfer  |
+|                             |         | request.                           |
++-----------------------------+---------+------------------------------------+
+|  SAHARA_MODE_MEMORY_DBEUG   |  0x2    | Memory debug mode. The host should |
+|                             |         | prepare to receive a memory dump   |
+|                             |         | from the target.                   |
++-----------------------------+---------+------------------------------------+
+|    SAHARA_MODE_COMMAND      |  0x3    | Command mode. The host executes    |
+|                             |         | operations on the target by sending|
+|                             |         | the appropriate client command to  |
+|                             |         | the sahara client running on the   |
+|                             |         | target. The Sahar client interprets|
+|                             |         | the client command and the response|
+|                             |         | is sent after execution of the     |
+|                             |         | given command.                     |
++-----------------------------+---------+------------------------------------+
+
+Hello response packet
+---------------------
+
+After the host validates the protocol running on the target, it sends a response
+to the target. The response contains the following information.
+1. The protocol version that is running.
+2. The minimum protocol version that it supports.
+3. The mode of operation.
+
+The host sets the packet status field to success if no errors occur on the host
+side. After the target receives this packet, it can proceed with data transfer
+requests or memory debug. The host uses the following format while sending a
+hello response packet.
+
++-----------+-------------+--------------------------------------+
+| Field     | Length      | Description                          |
+|           | (bytes)     |                                      |
++===========+=============+======================================+
+| Command   | 4           | Command identifier code              |
++-----------+-------------+--------------------------------------+
+| Length    | 4           | Length of the packet (in bytes)      |
++-----------+-------------+--------------------------------------+
+| Version   | 4           | Version number of this protocol      |
++-----------+-------------+--------------------------------------+
+| Compatible| 4           | Lowest Compatible version            |
++-----------+-------------+--------------------------------------+
+| Status    | 4           | Success or error code                |
++-----------+-------------+--------------------------------------+
+| Mode      | 4           | Mode of operation for target to      |
+|           |             | execute                              |
++-----------+-------------+--------------------------------------+
+| Reserved  | 4           | Reserved for future use              |
++-----------+-------------+--------------------------------------+
+| Reserved  | 4           | Reserved for future use              |
++-----------+-------------+--------------------------------------+
+| Reserved  | 4           | Reserved for future use              |
++-----------+-------------+--------------------------------------+
+| Reserved  | 4           | Reserved for future use              |
++-----------+-------------+--------------------------------------+
+| Reserved  | 4           | Reserved for future use              |
++-----------+-------------+--------------------------------------+
+| Reserved  | 4           | Reserved for future use              |
++-----------+-------------+--------------------------------------+
+
+
+Read data packet / 64 bit read data packet
+------------------------------------------
+
+The read data packet serves as a generic data transfer packet when any image
+data is to be transferred from the host to the target. This packet allows
+flexibility in the way that the image is transferred from the host to the
+target. As the target controls which data gets transferred, the target can
+determine what parts of the image get transferred and in what order. The host
+need not be familiar about the structure of the image. It must open the file and
+start transferring the data to the target based on the parameters specified in
+the packet.
+
+This gives the target complete control over how the images are transferred and
+processed. To initiate an image transfer, the target fills the read data packet
+with the image ID corresponding to the image that it wants to receive. The
+target also sends the offset into the image file and the length of the data(in
+bytes) it wants to read from the image. After the host receives this packet, the
+host responds with a data packet, which contains image data with the length
+specified in the read data packet. The host uses the following format while
+transferring the read data packet and 64-bit read data packet.
+
+
+Read data packet format
+=======================
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Image ID  |     4       | ID of the image to be transferred.   |
++-----------+-------------+--------------------------------------+
+| Data      |     4       | Offset into the image file to start  |
+| offset    |             | transferring data.                   |
++-----------+-------------+--------------------------------------+
+| Data      |     4       | Number of bytes target wants to      |
+| Length    |             | transfer from the image.             |
++-----------+-------------+--------------------------------------+
+
+
+64-bit read data packet format
+==============================
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Image ID  |     8       | ID of the image to be transferred.   |
++-----------+-------------+--------------------------------------+
+| Data      |     8       | Offset into the image file to start  |
+| offset    |             | transferring data.                   |
++-----------+-------------+--------------------------------------+
+| Data      |     8       | Number of bytes target wants to      |
+| Length    |             | transfer from the image.             |
++-----------+-------------+--------------------------------------+
+
+If any of the preceding fields are invalid, or if any other error occurs on the
+host, the host sends a data packet with length that does not match with what the
+target was expecting. The resulting error forces the target to send an end of
+image transfer packet with an error code in the status field and enables both
+the target and the host to enter an error handling state.
+
+End of Image transfer packet
+----------------------------
+
+If an image transfer is successfully completed, the target sends the host an end
+of image transfer packet with a success status. The target then waits for the
+host to send a done packet. If any error occurs during the transfer or
+processing of the image data, the status is set to the corresponding error code,
+and the target waits for a different command packet.
+
+The host uses the following format while transferring end of image transfer
+packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Image ID  |     4       | ID of the image that was being       |
+|           |             | transferred.                         |
++-----------+-------------+--------------------------------------+
+| Status    |     4       | Success or error code                |
++-----------+-------------+--------------------------------------+
+
+Done packet
+-----------
+
+If the host receives an end of image transfer packet with a success status, the
+host sends a done packet to indicate the target that it can exit the protocol
+and continue execution of code. The host uses the following format while sending
+the done packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+
+To transfer another image from the host, the target must re-initiate the
+protocol by starting with another hello packet.
+
+Done Response packet
+--------------------
+
+If the target receives a done packet, it responds with a done response packet
+containing the image transfer status. The target uses the following format while
+sending the done response packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Image Tx  |     4       | Indicates whether target is          |
+| Status    |             | expecting to receive another image   |
+|           |             | or not.                              |
++-----------+-------------+--------------------------------------+
+
+If all the images are transferred, the target sends a complete status to enable
+the host to exit the protocol. If all the images are not transferred, the target
+sends a pending status and waits for another hello packet to arrive.
+
+Reset Packet
+------------
+
+The host sends a reset packet to reset the target. The target services a reset
+request only if its in a state where reset requests are valid. If the target
+receives an invalid reset request, the target sends an error in an end of image
+transfer packet. The format of reset packet is as follows:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+
+
+Reset response packet
+---------------------
+
+If the target receives a valid reset request, it sends a reset response packet
+just before it resets. The purpose of this response is to acknowledge the host
+that the target received the reset request. The format of reset response packet
+is as follows:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+
+
+Memory debug packet
+-------------------
+
+The target initiates a memory dump by sending the host a memory debug packet.
+This packet contains the address and length of the memory debug table. The
+memory debug table is a listing of memory locations that can be accessed and
+dumped to the host. The target uses the following format while sending the
+memory debug packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Memory    |     4       | Target sets this field to the address|
+| table     |             | in memory that stores the memory     |
+| Address   |             | debug table.                         |
++-----------+-------------+--------------------------------------+
+| Memory    |     4       | Length in bytes of memory debug      |
+| table     |             | table.                               |
+| Length    |             |                                      |
++-----------+-------------+--------------------------------------+
+
+Given the memory table address and length, the host issues a memory read to
+retrieve the table. After the host receives the memory table information, it can
+decode each entry and issue memory read requests to dump each memory location.
+
+Memory read packet / 64-bit memory read packet
+----------------------------------------------
+
+The host issues memory read commands for each section of memory that it dumps.
+The host uses the following format while sending the memory read packet and 64
+bit memory read packet:
+
+Memory read packet format
+=========================
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Memory    |     4       | Memory location to read.             |
+| Address   |             |                                      |
++-----------+-------------+--------------------------------------+
+| Memory    |     4       | Length in bytes of memory to read    |
+| Length    |             |                                      |
++-----------+-------------+--------------------------------------+
+
+64 bit memory read packet format
+================================
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Memory    |     8       | Memory location to read.             |
+| Address   |             |                                      |
++-----------+-------------+--------------------------------------+
+| Memory    |     8       | Length in bytes of memory to read    |
+| Length    |             |                                      |
++-----------+-------------+--------------------------------------+
+
+The accessible regions are defined in the memory debug table. For each memory
+read command received, the target verifies that the specified memory(address and
+length) is accessible and responds with a raw data packet. The content and
+length of the raw data packet is the memory dump starting from the memory
+address and length specified in the memory read packet. The memory debug table
+can also be read using a memory read command by setting the address and length
+to the values specified in the memory debug packet.
+
+If any error occurs on the target, an end of image transfer packet is sent with
+the corresponding error code and the host recognizes whether it is actual memory
+data or an end of image transfer packet. The host issues a reset command on
+completion of a successful memory dump. However, the protocol does not force
+this implementation.
+
+Command ready packet
+--------------------
+
+The target sends this packet to the host to indicate that the target is ready to
+execute client commands. The target uses the following format while sending the
+command ready packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+
+
+Command switch mode packet
+--------------------------
+
+The host sends the command switch mode packet to the target so that the target
+can switch to another mode. The host uses the following format while sending the
+command switch mode packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Mode      |     4       | Mode of operation for target         |
+|           |             | to execute.                          |
++-----------+-------------+--------------------------------------+
+
+Command execute packet
+----------------------
+
+The host sends this packet to execute the given client command on the target. If
+the client command successfully executes, the target sends a command execute
+response packet. If an error occurs, the target sends an end of image transfer
+packet with the corresponding error code. The host uses the following format
+while sending command execute packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Client    |     4       | Client Command to be executed.       |
+| Command   |             |                                      |
++-----------+-------------+--------------------------------------+
+
+
+Client commands
+===============
+
++------------+-------------+--------------------------------------+
+|  Client ID |  Length     |          Description                 |
++------------+-------------+--------------------------------------+
+|   0x8      |    4        |      Get Command ID list.            |
++------------+-------------+--------------------------------------+
+|   0x9      |    4        |      Get DDR training data.          |
++------------+-------------+--------------------------------------+
+
+Command execute Response packet
+-------------------------------
+
+The target sends this packet if it successfully executes the client command. The
+target uses the following format while sending the command execute response
+packet.
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Client    |     4       | Client Command to be executed.       |
+| Command   |             |                                      |
++-----------+-------------+--------------------------------------+
+| Response  |     4       | Number of bytes for response data.   |
+| Length    |             |                                      |
++-----------+-------------+--------------------------------------+
+
+Command execute data packet
+---------------------------
+
+The host sends this packet if the response length received in the command
+execute response packet is greater than 0. The host uses the following format
+while sending command execute data packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Client    |     4       | Client Command executed.             |
+| Command   |             |                                      |
++-----------+-------------+--------------------------------------+
+
+The packet indicates the target to send the response data in a raw data packet.
+The target sends the response data upon receiving this packet.
+
+64-bit memory debug packet
+--------------------------
+
+The target sends this packet to the host to initiate a memory dump. The packet
+contains 64-bit address and length of the memory table. The target uses the
+following format while sending 64-bit memory debug packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Memory    |     8       | Target sets this field to the 64-bit |
+| table     |             | address in memory that stores the    |
+| Address   |             | memory debug table.                  |
++-----------+-------------+--------------------------------------+
+| Memory    |     8       | Length in bytes of memory debug      |
+| table     |             | table.                               |
+| Length    |             |                                      |
++-----------+-------------+--------------------------------------+
+
+Reset Sahara state machine packet
+---------------------------------
+
+The host sends a reset sahara state machine packet whenever it wants to reset
+Sahara state machine. When the target receives a reset sahara state machine
+request, it reinitializes sahara protocol and sends the hello packet to the
+host. The sahara protocol is restarted without a target reset. The host uses the
+following format while sending the reset sahara state machine packet:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+
+Write data packet
+-----------------
+
+Write data packet serves as a generic data transfer packet when any data is
+transferred from the target to the host. This packet allows flexible data
+transfer from the target to the host.
+
+As the target controls what data gets transferred, target can determine what
+parts of the data get transferred and in what order. The host does not need to
+know anything about the structure of the data. It only needs to open the file
+and start accepting the data to the host based on the parameters specified in
+the packet.
+
+To initiate a write data transfer, the target fills the write data packet with
+the image ID corresponding to the image data that it wants to send. The target
+also sends the offset into the output file and the length of the data(in bytes)
+it wants to write from the target. As soon as the host receives the packet, the
+host opens an output file and waits to receive the data packets. After the
+packet is received, the content from the data pcket is written to the output
+file, The format of the write data packet is as follows:
+
++-----------+-------------+--------------------------------------+
+|  Field    |  Length     |          Description                 |
+|           |  (bytes)    |                                      |
++-----------+-------------+--------------------------------------+
+| Command   |     4       |      Command identifier code         |
++-----------+-------------+--------------------------------------+
+| Length    |     4       | Length of the packet(in bytes)       |
++-----------+-------------+--------------------------------------+
+| Data      |     8       | Offset into the image file to start  |
+| offset    |             | writing the data to host.            |
++-----------+-------------+--------------------------------------+
+| Image ID  |     4       | ID of the image to be transferred.   |
++-----------+-------------+--------------------------------------+
+| Data      |     4       | Number of bytes target wants to      |
+| Length    |             | transfer the data to the host.       |
++-----------+-------------+--------------------------------------+
+
+
+Command packet flow between host and target
+-------------------------------------------
+
+Packet flow is a process of exchange of information as packets between the host
+and the target in a specific way using command packets. The sahara protocol
+allows packet processing for the following scenarios:
+
+1. Transferring an image from the host to the target.
+2. Dumping memory from the target to the host.
+3. Loading DDR calibration data on flashless target.
+
+Packet flow for Image transfer
+------------------------------
+
+The packet flow is performed between the host and target for a successful image
+transfer.
+
+.. code-block:: text
+
+                        Host                       Target
+                          |          HELLO            |
+                          |   (mode = image transfer) |
+                          |<--------------------------|
+                          |                           |
+                          |         HELLO RESP        |
+                          |   (mode = image transfer) |
+                          |-------------------------->|
+                          |                           |
+                          |         READ_DATA         |
+                          |   (img ID, 0, offset,     |
+                          |   size of image header)   |
+                          |<--------------------------|
+                          |                           |
+                          |         RAW_DATA          |
+                          | (size of image header)    |
+                          |-------------------------->|
+                          |                           |
+                          |         READ_DATA         |
+                          | (img ID, segment 0 offset,|
+                          |  size of segment 0)       |
+                          |<--------------------------|
+                          |         RAW_DATA          |
+                          |     (size of segment 0)   |
+                          |-------------------------->|
+                          |                           |
+                          |         READ_DATA         |
+                          | (img ID, segment 1 offset,|
+                          |  size of segment 1)       |
+                          |<--------------------------|
+                          |                           |
+                          |                           |
+                          |         RAW_DATA          |
+                          |    (size of segment 1)    |
+                          |-------------------------->|
+                          |          ...              |
+                          |          ...              |
+                          |          ...              |
+                          |          ...              |
+                          |                           |
+                          |                           |
+                          |         READ_DATA         |
+                          | (img ID, segment N offset,|
+                          |  size of segment N)       |
+                          |<--------------------------|
+                          |                           |
+                          |                           |
+                          |                           |
+                          |         RAW_DATA          |
+                          |    (size of segment N)    |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |       END_IMAGE_TX        |
+                          |<--------------------------|
+                          |                           |
+                          |                           |
+                          |          DONE             |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |         DONE_RESP         |
+                          |<--------------------------|
+                          |                           |
+
+The packet flow sequence for image transfer is as follows:
+
+1. A hello packet is sent from the target to the host to initiate the protocol
+   with the mode set to either image transfer pending or image transfer
+   complete (depending on the target's boot sequence).
+
+2. The host sends a hello response packet with a success status and sets the
+   mode to the mode received in the hello packet. After it receives the hello
+   packet and validates the protocol version running on the target.
+
+3. After the target receives the hello response, the target initiates the
+   image transfer request by sending read data packets. Each read data packet
+   specifies the image that the target wishes to receive and what part of the
+   image is to be transferred.
+
+4. During normal operation, the target first requests image header information.
+
+   a. The image header information specifies image size and location of the
+      image data that is to be transferred.
+
+   b. The image header information (which is sent as a read data request)
+      allows the target to know the format of the image to be transferred.
+      The protocol does not require the host to know anything about the
+      image formats and allows the host to read and transfer data from the
+      image as requested by the target.
+
+   c. If the image is a standalone binary image without any data segmentation
+      (which means the data is entirely contiguous when stored as well as
+      transferred to the target system memory), then the target requests for
+      entire image data to be sent in one transfer.
+
+   d. If the image data is segmented and requires scattering of the data
+      segments to noncontiguous system memory locations, the target issues
+      multiple read data requests to enable each data segment to be
+      transferred directly to the respective destination address. This
+      scattered information resides in the image header and is parsed by the
+      target before issuing the read data requests.
+
+5. After receiving a read data request, the host parses the image ID, data
+   offset, and data length to transfer data from the corresponding image file.
+   The host sends the requested data without any packet header.
+
+6. The target directly transfers the data to the destination address without
+   any software processing or temporarily buffering of the data in system
+   memory by transferring the image header to the targert and setting the
+   receive buffer for the data as the destination address in system memory.
+
+7. After the target successfully receives all segments for an image, the
+   target sends an end of image transfer packet with the image ID of the
+   corresponding image, and a success status. The host stops reading and
+   closes the image file after receiving the success status.
+
+8. The host sends a done packet to allow the target to exit the protocol after
+   it receives a successgul end of image transfer packet.
+
+9. After the target receives the done packet, the target sends a done response
+   packet to the host. This packet indicates if the target expects another
+   image to be transferred and if the host can continue to run the protocol.
+
+Packet flow for memory debug
+----------------------------
+
+The packet flow is performed between the host and the target for the successful
+memory debug.
+
+.. code-block:: text
+
+                        Host                       Target
+                          |          HELLO            |
+                          |   (mode = memory debug)   |
+                          |<--------------------------|
+                          |                           |
+                          |         HELLO RESP        |
+                          |   (mode = memory debug)   |
+                          |-------------------------->|
+                          |                           |
+                          |         MEMORY_DEBUG      |
+                          |   (location of mem table, |
+                          |   size of memory table)   |
+                          |<--------------------------|
+                          |                           |
+                          |         MEMORY_READ       |
+                          |   (Address from region 0 ,|
+                          |    size of region 0)      |
+                          |-------------------------->|
+                          |         RAW_DATA          |
+                          |     (size of region 0)    |
+                          |<--------------------------|
+                          |                           |
+                          |         MEMORY_READ       |
+                          |   (Address from region 1 ,|
+                          |    size of region 1)      |
+                          |-------------------------->|
+                          |         RAW_DATA          |
+                          |     (size of region 1)    |
+                          |<--------------------------|
+                          |         MEMORY_READ       |
+                          |   (Address from region 2 ,|
+                          |    size of region 0)      |
+                          |-------------------------->|
+                          |         RAW_DATA          |
+                          |     (size of region 2)    |
+                          |<--------------------------|
+                          |          ...              |
+                          |          ...              |
+                          |          ...              |
+                          |          ...              |
+                          |                           |
+                          |         MEMORY_READ       |
+                          |   (Address from region N ,|
+                          |    size of region N)      |
+                          |-------------------------->|
+                          |         RAW_DATA          |
+                          |     (size of region N)    |
+                          |<--------------------------|
+                          |                           |
+                          |          RESET            |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |        RESET_RESP         |
+                          |<--------------------------|
+                          |                           |
+
+The packet flow sequence for image transfer is as follows:
+
+1. A hello packet is sent from the target to the host to initiate the protocol
+   with mode set to memory debug.
+
+2. The host sends a hello response packet with a success status and sets the
+   mode to memory debug after it receives the hello packet and validates the
+   protocol version running on the target.
+
+3. After the target receives the hello response, the target initiates the
+   memory dump by sending a memory debug packet with the location and size of
+   the memory debug table. The memory debug table specifies accessible memory
+   regions.
+
+4. The host then initiates a memory read packet to read the memory debug
+   table and receives the table in a raw data packet after it receives the
+   memory debug packet.
+
+5. The host then decodes the table and issues memory reads for each accessible
+   region. The data for each region is sent in a raw data packet.
+
+6. Upon completion, the host issues a reset to the target. The target sends a
+   reset response and resets the target.
+
+7. The host can alternatively send a command switch mode packet to allow the
+   target to switch modes and avoid a reset.
+
+
+Packet flow to load DDR calibration data on target
+--------------------------------------------------
+
+The packet flow is performed between the host and the target to load DDR
+calibration data on flashless target. This packet flow is initiated when the
+device boots up for the first time and needs DDR calibration. This packet flow
+is also initiated in other scenarios, such as build update or any reason for
+which DDR calibration data gets corrupted.
+
+First boot scenario or invalid calibration data in filesystem.
+--------------------------------------------------------------
+
+.. code-block:: text
+
+                        Host                       Target
+                          |          HELLO            |
+                          |   (mode = image transfer) |
+                          |<--------------------------|
+                          |                           |
+                          |         HELLO RESP        |
+                          |   (mode = image transfer) |
+                          |-------------------------->|
+                          |                           |
+                          |         READ_DATA         |
+                          |   (img ID:34, 0, offset,  |
+                          | size of DDR training data)|
+                          |<--------------------------|
+                          |                           |
+                          |         RAW_DATA          |
+                          |(size of DDR training data)|
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |       END_IMAGE_TX        |
+                          |<--------------------------|
+                          |                           |
+                          |                           |
+                          |          DONE             |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |         DONE_RESP         |
+                          | (mode = IMAGE_TX_PENDING) |
+                          |<--------------------------|
+                          |1. First boot scenario.    |
+                          |   DDR driver performs     |
+                          |   calibration and returns |
+                          |   to SBL.                 |
+                          |2. Next: Push DDR          |
+                          |  Calibration data to host |
+                          |                           |
+                          |                           |
+                          |          HELLO            |
+                          |   (mode = COMMAND mode)   |
+                          |<--------------------------|
+                          |                           |
+                          |         HELLO RESP        |
+                          |   (mode = COMMAND mode  ) |
+                          |-------------------------->|
+                          |                           |
+                          |         CMD_READY         |
+                          |<--------------------------|
+                          |                           |
+                          |         CMD_EXEC          |
+                          |(cmd id = 8, Get command   |
+                          | ID to be executed)        |
+                          |-------------------------->|
+                          |                           |
+                          |       CMD_EXEC_RESP       |
+                          |(cmd id: 8, resp len = 4)  |
+                          |<--------------------------|
+                          |                           |
+                          |    CMD_EXEC_GET_DATA      |
+                          |        (ID = 0x8)         |
+                          |-------------------------->|
+                          |                           |
+                          |          RAW_DATA         |
+                          |       (0x00000009)        |
+                          |<--------------------------|
+                          |                           |
+                          |         CMD_EXEC          |
+                          | (cmd id: 9, resp len > 0) |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |       CMD_EXEC_RESP       |
+                          |(cmd id: 9, resp len > 0)  |
+                          |<--------------------------|
+                          |                           |
+                          |    CMD_EXEC_GET_DATA      |
+                          |        (ID = 0x9)         |
+                          |-------------------------->|
+                          |                           |
+                          |          RAW_DATA         |
+                          |   (valid training data)   |
+                          |<--------------------------|
+                          |                           |
+                          |3. Host sends switch to    |
+                          |image tx mode to continue  |
+                          |booting.                   |
+                          |                           |
+                          |                           |
+                          |      CMD_SWITCH_MODE      |
+                          | (mode = IMAGE_TX_PENDING) |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |          HELLO            |
+                          | (mode = IMAGE_TX_PENDING) |
+                          |<--------------------------|
+                          |                           |
+                          |         HELLO RESP        |
+                          | (mode = IMAGE_TX_PENDING) |
+                          |-------------------------->|
+                          |                           |
+                          |4. Boot/Load rest of the   |
+                          |    images....             |
+                          |                           |
+                          |       END_IMAGE_TX        |
+                          |<--------------------------|
+                          |                           |
+                          |                           |
+                          |          DONE             |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |         DONE_RESP         |
+                          |(mode = IMAGE_TX_COMPLETE) |
+                          |<--------------------------|
+                          |                           |
+
+The packet flow sequence is as follows :
+
+1. The target sends the hello packet to the host to initiate the protocol
+   with the mode set to image transfer pending.
+
+2. The host sends a hello response packet with a success status and sets the
+   mode to image transfer pending after it receives the hello packet and
+   validates the protocol version running on the target.
+
+3. After the target receives the hello response, it initiates the data
+   transfer by requesting the size of DDR training/calibration data.
+
+4. The host sends back the DDR training/calibration data to the target.
+
+5. The target decodes the training data and does not find valid DDR
+   calibration data, target sends END_IMAGE_TX to interrupt the transfer.
+
+6. The host sends DONE after receives END_IMAGE_TX.
+
+7. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has
+   not received all images.
+
+8. The target executes DDR training process to generate valid DDR calibration
+   data and prepares to push back to host.
+
+9. The target initiates protocol by sending a hello packet with COMMAND_MODE
+   to the host.
+
+10. The host sends a hello response packet with a success status and sets the
+    mode to COMMAND_MODE.
+
+11. The target sends CMD_READY to the host.
+
+12. The host receives CMD_READY and starts to get command IDs to be executed.
+
+13. The target sends CMD_ID = 9 to push DDR calibration data to host.
+
+14. The host executes CMD_ID = 9 to get DDR calibration data from the target.
+
+15. The target sends RAW_DATA with the payload which contains DDR calibration
+    data to host.
+
+16. The host saves training data in the kernel buffer and exposes to userspace
+    via the sysfs entry. The host sends CMD_SWITCH_MODE with the mode set to
+    IMAGE_TX_PENDING to continue booting.
+
+17. After the target receives the CMD_SWITCH_MODE command, it sends HELLO to
+    the host with the mode set to IMAGE_TX_PENDING. The target and the host
+    repeat the packet flow for image transfer to get all booting-required
+    images.
+
+18. Upon successful transfer of all images, the target sends an END_IMAGE_TX
+    packet with a success status to the host.
+
+19. The host sends DONE after it receives END_IMAGE_TX.
+
+20. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
+    it has received all images. The process has been completed after the host
+    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.
+
+Subsequent boot scenario with valid DDR calibration data
+--------------------------------------------------------
+
+The below firgure shows the subsequent boot scenario with valid DDR calibration
+data process being loaded from host to target.
+
+.. code-block:: text
+
+                        Host                       Target
+                          |          HELLO            |
+                          |   (mode = image transfer) |
+                          |<--------------------------|
+                          |                           |
+                          |         HELLO RESP        |
+                          |   (mode = image transfer) |
+                          |-------------------------->|
+                          |                           |
+                          |         READ_DATA         |
+                          |   (img ID:34, 0, offset,  |
+                          | size of DDR training data)|
+                          |<--------------------------|
+                          |                           |
+                          |         RAW_DATA          |
+                          |(size of DDR training data)|
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |       END_IMAGE_TX        |
+                          |<--------------------------|
+                          |                           |
+                          |                           |
+                          |          DONE             |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |         DONE_RESP         |
+                          | (mode = IMAGE_TX_PENDING) |
+                          |<--------------------------|
+                          |                           |
+                          | Subsequent boot scenario  |
+                          | (valid calibration data)  |
+                          | DDR driver configures DDR |
+                          | using valid calibration   |
+                          | data                      |
+                          |                           |
+                          |                           |
+                          |          HELLO            |
+                          | (mode = IMAGE_TX_PENDING) |
+                          |<--------------------------|
+                          |                           |
+                          |         HELLO RESP        |
+                          | (mode = IMAGE_TX_PENDING) |
+                          |-------------------------->|
+                          |                           |
+                          | Boot/Load rest of the     |
+                          |    images....             |
+                          |                           |
+                          |       END_IMAGE_TX        |
+                          |<--------------------------|
+                          |                           |
+                          |                           |
+                          |          DONE             |
+                          |-------------------------->|
+                          |                           |
+                          |                           |
+                          |         DONE_RESP         |
+                          |(mode = IMAGE_TX_COMPLETE) |
+                          |<--------------------------|
+                          |                           |
+
+The packet flow is as follows :
+
+1. The target sends the hello packet to the host to initiate the protocol
+   with the mode set to image transfer pending.
+
+2. The host sends a hello response packet with a success status and sets the
+   mode to image transfer pending after it receives the hello packet and
+   validates the protocol version running on the target.
+
+3. After the target receives the hello response, it initiates the images
+   transfer by requesting the training/calibration data from the host.
+
+4. The host sends back the DDR training/calibration data to the target.
+
+5. The target decodes the DDR training/calibration data and finds valid DDR
+   calibration data.
+
+6. The host sends RAW_DATA with the size of the DDR calibration data to the
+   target.
+
+7. Upon successful transfer of DDR calibration data, the target sends an
+   END_IMAGE_TX packet with a success status.
+
+8. The host sends DONE after it receives END_IMAGE_TX.
+
+9. The target sends DONE_RESP with mode = IMAGE_TX_PENDING because it has not
+   received all images.
+
+10. The target continues booting with valid DDR calibration data.
+
+11. The target and the host repeat the packet flow for image transfer to get
+    all booting-required images.
+
+12. After successful transfer of all images, the target sends an END_IMAGE_TX
+    packet with a success status to the host.
+
+13. The host sends DONE after it receives END_IMAGE_TX.
+
+14. The target sends DONE_RESP with the mode set to IMAGE_TX_COMPLETE because
+    it has received all images. The process has been completed after the host
+    receives DONE_RESP with the mode set to IMAGE_TX_COMPLETE.

-- 
2.34.1


