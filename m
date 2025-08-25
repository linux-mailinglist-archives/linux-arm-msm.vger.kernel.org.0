Return-Path: <linux-arm-msm+bounces-70607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC83B33C6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:19:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98048165281
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3608F2C1597;
	Mon, 25 Aug 2025 10:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7oIUzHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541629D270
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756117183; cv=none; b=hURQkSkmlZ44MGK7Rsm4hImSCAGCudUGdxDtpbGL8hVWCV71QZtCnzcpRxsbhNBZq7byKM1ysLBE8hQzZYzSMXStBZn1ipgprNDf3JlBViFQVJ4IrETKKkMaQ4R3k4IGcAJ4lShuyP/1lW5Zep0sD7H4UHtPSP8aJKn2Z5Oi874=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756117183; c=relaxed/simple;
	bh=MpRnaVmZuRxXkDAwm5uP4a6UN9J0GDWnSpcWXNw+nXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N1IqaAL4vcpHrQxunjdKmFtnI/c4CpQ7w9vZ6rOxC5Z61ZoROrv3bWIvyrpQlv8gJ1gUTp4JlS2jUNNLaWQy9vaDNw9AXYZfdfwOQ7AqHnzrPrBNw8GtNSZ8kzdLHAwbc0M5Q6cGlSk79yN24rFmi1VHY4rUU7e59fw0SLAp98I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7oIUzHS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8S7GZ028616
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iprrmJIJboM
	J1ZYNyCZw7nI2gqXWJqAFklPr1heU06M=; b=f7oIUzHSI5i90TbL1jCZcMaxXJP
	kN85jEryghhOONXvkM1yo39vBFYRgTrasujlpQaFRW0F+bXQu9XkAr5rS3sy15wv
	3ReTSjlEPxgZreGvvuuNuEstB05GnAcbe3zGFlX25Ahk6EOs1vgnMI8rDMAxJJRh
	6n+GD+98LVgbX2EtCbHpOB4zVsV7j20J4o32H3VD7R3b7gwhn71gCBoDCfhogHbe
	vGfI+pMnzydTYcECEd2ZkFDTeWoOgyVO5rtyEN1nmG/H+ljNwywp6JHknqmkpCIZ
	wIhTOd8ZgPLS/p5GwLgxPArOswIUkQqAesvlPyuubVNyKQrW4PVVoJfdfsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdvn83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:19:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2463648439eso43758355ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756117177; x=1756721977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iprrmJIJboMJ1ZYNyCZw7nI2gqXWJqAFklPr1heU06M=;
        b=IawVHdGw+RTP9uuMr52ZWVSXZNqXYNN04i0NlY7MAbb4KoCSst4GU6SX1jbB+qNKoY
         v19DkHOEL4WjWTde7R3Bq1CjGZUiYJLIN4ovWMb4cq8X+J3t85ft/dOJNxsekYGgtqLW
         gAn+vPP43gg2F0zOU7qf4MXTuDqc+q8P6OY8qUw7UKad80EQ7elFLr+TZK2PTdTgoB8l
         Zf9knEbBhKdMKjcYnyxH9EpjW277ddH6FOig2uuXwqZouplEkRa8og/N4Iz1H10ooxb7
         wzc/z21nxU1MXfVTYajNwTvBXdxLo5OH+t4ewL4CUKspPJ4tX2u9EAGALROOx+3dBaUR
         tzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVsH383ToT/LUzA2JkWccJ8VQWRKYCACQJ2bTx1/y7UoesXETB3RuXaeE1PIRCL8pgS7uX6pokOcAw+srQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq29PX49edx1LdGRC9nZ6uNDkNkbPzSSkFpZkUdgj7V0hm3X3n
	m6Pfe+YD0aA78lWr7C89dri//HLY/hlIPn80FCPMogurwtsqf5gn/EZ12fhc9ddlyTpn/zdCSSG
	5NPu7PaCFundkIR62Y5UgWMHYYpEZPfurJ2ZBKXL89G93sfDBMTm73yHJVir6mxy+c8W7
X-Gm-Gg: ASbGnctfp2RujJrgu0MaF+szPu/EHYc6PtM3q/W7WfUkhdmf2Txy3oyZ0hjYjP34r8E
	TMS/+f366gWrdWXnDXQR4/owjln3/CIWoyixADF8PBFtbYggC3Ep1qn1sG/eqLIWEQefMUqMD0y
	SKk3hib/BUepOMMe24Lvs8hhVPBsTo+UIJgXNPpfz/gysPqfsy1ec1f/4+jhgw3j32RWX7jhQ5O
	VWlRjprnGqRaqRVtVF6ylXBYeeAiIut4JTpKNGn/9yQaC4+YYtZ90wsfQu7FOXUeXQAUqDL5GEp
	GWm+RmmNWGSTkjgRxA0iHqTjSBeEn5RQB+C/d4ynfaeLsa6ZO+J9hZ2pNTVFoMFlAyvT/A==
X-Received: by 2002:a17:902:da82:b0:246:b47f:9aeb with SMTP id d9443c01a7336-246b47fa37emr52537035ad.21.1756117175978;
        Mon, 25 Aug 2025 03:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHy4t44YZsmg5zvZfKpc70yZKfRh0wtnXTYKpsmz3lj8fmSlJG8sM60QqBjjD+VFC8nKl1EtQ==
X-Received: by 2002:a17:902:da82:b0:246:b47f:9aeb with SMTP id d9443c01a7336-246b47fa37emr52536055ad.21.1756117174288;
        Mon, 25 Aug 2025 03:19:34 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687cedb2sm64540585ad.68.2025.08.25.03.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:19:33 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 01/12] Add documentation for Sahara protocol.
Date: Mon, 25 Aug 2025 15:49:15 +0530
Message-Id: <20250825101926.2160554-2-kishore.batta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LJs4O4I9M0VcsHD5ef0kVGiUqbdR9SG6
X-Proofpoint-ORIG-GUID: LJs4O4I9M0VcsHD5ef0kVGiUqbdR9SG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4v8mN0CcqFh6
 KOOvVE23RS3dqMPOKhXcIn33T1RcP2BoLPwROQNAd711SCjykRRgq+FzQolgCMkie+HiZLoAULI
 uLMAVOgda7xBPnuW73PGgOJ1Qj+5HyFuQoEfEJCZldXDXoAxu9BeA20yq5GOBczuyU3mHbb4ZU8
 +dbA3XkNwM3++NnE5Srz3q//QhCo4OTVdFmDqTVdb8M99EG1YoaFKTVqycG0pBt1jyg19F/qFQm
 pG5z8/jLWWTXb7PtQoplBQsXv9Sk+E2Cz2gLU8vGtAyA/ncjit1EbVN8Do1W7ewuKhWSydZS4bh
 /rLqVFn077VISp+IHvy0ESNpvu895EruAzrpgReBmDH/rJCDICGnV9i0NrB9jZ55cWStensd0Rt
 bE/uPgLq
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac38ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=MMUwo3wwYuTaqRZ-dQsA:9
 a=t_MdwZQk9VBQcGG5:21 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

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
 Documentation/sahara/sahara_protocol.rst | 1241 ++++++++++++++++++++++
 2 files changed, 1255 insertions(+)
 create mode 100644 Documentation/sahara/index.rst
 create mode 100644 Documentation/sahara/sahara_protocol.rst

diff --git a/Documentation/sahara/index.rst b/Documentation/sahara/index.rst
new file mode 100644
index 000000000000..073002c15a20
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
index 000000000000..91204bb7d170
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


