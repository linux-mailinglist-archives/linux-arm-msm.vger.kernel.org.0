Return-Path: <linux-arm-msm+bounces-92218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDVQLJ6ViWlj/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:06:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48310CC0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7DD13003EA1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD51C33A6FB;
	Mon,  9 Feb 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WysstYfu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="asK8R7gE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77904332EB7
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770624384; cv=none; b=LqToz1/lfCOvKk83WidUK8Pf0yJGMeMkAEgeWPp+A5gjamlBbufMR9W377M8F8SCGfBIljm0fQ3IlqwzAQwwKWShBezfufCrScJ4WAo2dOQ/x8ymTP6GoxoV1cXKSs2dKzNF51ydblROFT0i0chC+qGwULBVX9ec0/ZmbVKy2Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770624384; c=relaxed/simple;
	bh=WdTFhUhYNy+Qr5D7EpuxAXZZV6xccSry5Pqx2XT4bFk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wh/EcTXhi/ptxpeZs2bLdXWYjmT8TLIyGZ+OAgAbaH+T/X2uBTDH+392mkaJ7e44o6Np39zGLY6Ow5ZFuOdMkMPgmuyjmXTvNeO4mE9bMhVsNYRJj/K0B86g1rn97IFOqJTVO18jYrqfYw4kg2pSRnbjVsiPb9/K8mDP0Un9nt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WysstYfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=asK8R7gE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6196Dkre2099750
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gn7LjEZCpdTeQmgP3hr1wdSVyYWAIYmtCsl
	/3Vz/CDA=; b=WysstYfuJ4ZcpgnwWrpR1+V/2bcn5xD7I2ZW7Wc4sfOOu+i6bxV
	7rD7f5XgEReCiGY0HQUR7m3iwSG9V1cO2advSw+SAqMO2JhD1TRVrQE4SUKCs1fv
	G09rnzshWyqyOuZaIejN4aXdPIlQyWX6mYlJoVinpadwcovZi/9IboqAYpM7v7ci
	j2eqi4CckRxYFrWc9QuFJ6MCUrYIC8uccO4T8MX3O94SW9tlBZhXVAF8QAvKSnM+
	KiCyjnLT7vSJd+0z6ZUJCbo5p/RLEOAIQsPVbRh3bpN7kQz5TaW/fbi381BJbzHX
	NjkbZczsqdCp0v1Zp0N49f3k8+fRKGeGkVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c64hnkqhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:06:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35449510446so3673642a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770624383; x=1771229183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gn7LjEZCpdTeQmgP3hr1wdSVyYWAIYmtCsl/3Vz/CDA=;
        b=asK8R7gELiKq20OGvbHY9mzrMKs8Mlko3/U9Fuban5PMcJjor71cLVo988P1bYIjgX
         7gV/NnYsN7I1JOcKBwQc9GJ7cuFlhivzYhaL6n3Q/igU8kLdEtjmUvBhQgCPtDont8OJ
         GrVlcaBacQ5qyrRdpGODK3abCeW1aL5Yht4hWtzzZw9SH9pL74Z0J1tasU/UxJMMMAH7
         9V0JNvF+c+BlWQ+VDGfIEaWZ/qpFpLN41DJCwrucUGmKm+xE7TyNIZ+NpOfmBtxDeZTb
         hZm7gSEu33FaF9kAWa5JgJsB2mISir0rxSFTrwtOjB5yFqQy9NZ0qrPLhbptT2wH2QPE
         NeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770624383; x=1771229183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gn7LjEZCpdTeQmgP3hr1wdSVyYWAIYmtCsl/3Vz/CDA=;
        b=ig3RV4zQhKLo/RSfMDS99bikmwoo7AbiH09Ka3w5gGyEFWubv/1BFRoLgdr46XwIAJ
         FSvgpVsfo5sI6uF2I+VaF48LDv4TNsL9z3XVJepoieV/GcbHFIzKxNJbnOCEPXQ2K0X7
         a0Y2kUTBRjGVtEkKA06imqD8mSH2+3WaFvY5VF6d+xLRoFVMWS7f82I1bouJLpvVdz0l
         6VX2eG2EcKrF11v2ajgfULsQ240TWKU94uevj8hLNJftIKi5rLDLsA5Cjk8TVajEprbQ
         8Ion88BQiynlfplfbrH3FqOY5fNLBamywHm1S5cw+L1NeZsXL5zEcw5AUMW/IsrlirXS
         rlbA==
X-Forwarded-Encrypted: i=1; AJvYcCUrxehQS2espPpdy7At78Mj5sc6aO/1FQHqc3f3GBoc9xB7qFmwVPQlOuJbkfBINlg7y+a56jUTs/BkoERp@vger.kernel.org
X-Gm-Message-State: AOJu0YxDwE4g88a1/blrUreLP0kkgYBN4Ci8hRPRuv2ircIkFBGsPGkc
	+cAfJ2ap1Qjqd9gNMlj9fPB0pQaYQZQjJQeGWFdlDCiN3v22K7NHEOl02BABORDrSjpSlzSrKZ2
	4TOpVCOw7WFMSjtZc3URipzObrPvZiFoRr5+PRRWfmueuEqPW9LXHhLiru+aEq4Os95JS
X-Gm-Gg: AZuq6aLqw6J/9p/WDcZZBwHdZAu9SKmq5WGBlUyuqJXw+3Rmg6FkyZpjmDc8USTiLLk
	fFlyQNKA2tsJ83wBrw0U959C1BHAs80eeE4KTd/nO7GYgd+4WGQWOF0YOtA7MbQRLq7O9/2gIN5
	KerJWhaA2swDTcVGgx+d9Fn9wxla8eFvwZUbaxEICgA2+dkW0hh3d3yKtajQVptRaa+QFK1b2/W
	yC2UFLJ9VRvcExEwU2vKrv7sTz7Ps21jKBZYhie4frXlhUDcT56VHvJfAIswXaMkgzQodeSvjt4
	GaAUlwY3gdpCbftxpR81cIDjB1BsqeI6ZyZuelmxgUcnG7SI4Go+XcTy8xHsMhiMEkEIXSt5Mah
	MMGkHiVr+cfaEKoLVf+czzsVa2JU2F3iG84JVoPg=
X-Received: by 2002:a05:6a21:6e43:b0:36b:38e0:4bf0 with SMTP id adf61e73a8af0-393ad3b20ecmr10910316637.60.1770624382887;
        Mon, 09 Feb 2026 00:06:22 -0800 (PST)
X-Received: by 2002:a05:6a21:6e43:b0:36b:38e0:4bf0 with SMTP id adf61e73a8af0-393ad3b20ecmr10910285637.60.1770624382278;
        Mon, 09 Feb 2026 00:06:22 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb4fb713sm9202221a12.3.2026.02.09.00.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 00:06:22 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Cover letter QCC2072 enablement
Date: Mon,  9 Feb 2026 13:36:11 +0530
Message-Id: <20260209080613.217578-1-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zJB1OYXtqdp1DDwx-cugrGiYcAFyS7V6
X-Proofpoint-ORIG-GUID: zJB1OYXtqdp1DDwx-cugrGiYcAFyS7V6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2NSBTYWx0ZWRfX5F67vXSM65e0
 4PplNdqTZEBPw71Eb7WTx3go6esbW1l0nPcI0O/D7kDKlKn3jTgKxhB3XvO7kxoCSTX6hN7whQC
 1mCeQ6gr3zi2vIVSbfxBNvcA2ZK/nIwabE3LD/41dRwPoSwhvpNxOmSuZbtxm8VSv70L42gYgTT
 dS8BeMMLzOYmDAD02SHTSGLSlH10evyRUliouIN7iSCGIXKf+aVNB7QKikKTGElc+IzZwtk2lXq
 gAhvcCoRz5nszk38Ib9Xpgee89qPmhAc+Ut81i5dD2MSNpdfKdg4SKX+dXUuJdRUTXQqhZ7BX/o
 u4aG6wQYV+rIXcDP6Lovvbe6wL6KB4ZPKM1Ki6TNBYUw/Y0oMwWxQDG/OGFsgoXvKc7PZ6OGy6P
 CISHwVjGvA2r/CLJo8XAuKwDk+sPYvjyBnG4SXK09lhKpO2CotDLhefPAz0rCDwT4lZzKt3iIEc
 7ufwpe5B3DI77V1nAjw==
X-Authority-Analysis: v=2.4 cv=SNlPlevH c=1 sm=1 tr=0 ts=6989957f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=p80hBS5HLWMqOVl_yXAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090065
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,kernel.org,quicinc.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92218-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.991];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A48310CC0A
X-Rspamd-Action: no action

The history of the patch set as follows.
v1: First commit to add support of QCC2072 chipset
v2: resolving review comments to sort the chipset in the switch case
    and other files whenever possible. "qca_btsoc_type" enum in 
    drivers/bluetooth/btqca.h contains all the soc type which need to be 
    enabled for BT enablement on the target device. There are few places 
    where logic of framing packets transferring between SoC  and Host 
    depends on the which generation of the chip it is, refer api 
    "qca_read_soc_version". So It is not sorted in btqca.h file.
v3: indentation fix and "qcom,wcn3950-bt" is deleted by mistake.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>      

Vivek Sahu (2):
  dt-bindings: net: bluetooth: qualcomm: add bindings for QCC2072
  Bluetooth: qca: add QCC2072 support

 .../net/bluetooth/qualcomm-bluetooth.yaml     |  3 +-
 drivers/bluetooth/btqca.c                     | 41 +++++++++++--------
 drivers/bluetooth/btqca.h                     |  1 +
 drivers/bluetooth/hci_qca.c                   | 40 +++++++++++++-----
 4 files changed, 56 insertions(+), 29 deletions(-)

-- 
2.34.1


