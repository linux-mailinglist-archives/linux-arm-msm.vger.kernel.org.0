Return-Path: <linux-arm-msm+bounces-112040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yejYLGPIJ2py2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:01:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9FA65D7FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pDnRdHs5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LCwN+FzF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112040-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112040-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5AC2E304F223
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B744F3F413A;
	Tue,  9 Jun 2026 07:53:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008B03F39E3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:53:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991617; cv=none; b=OZSmi6ARAKOyokfUvPwviqo5HuUnkCrfDw/BwXLTQJGazbX8n1+Z+jRouj7mHyfvG2GU9VuHysiR3+4/ulTdzPUDRn1HiP6jkICd+m0cajurFHIH7QuMGdW/2CoVVtQzGuy15VnekYI55WFhmJkpmzju9CUap1HxrUwSD/1qB88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991617; c=relaxed/simple;
	bh=OKx/GH7ZUq9+Mjfs4xDvFsGX2/Vn8N7/Q0k8/BzXAPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dx0Ecbw8yguqollTWkjl1Gei74QW3s2Oclv3/UakaqKbjW/0HTBalJTnCaamg9ZWLQ5pEyrR0Gy9RLccrojQ2JGJHwkFOX5CRph1IPKOs4FqZYnhQxkO8BZjxLhEe78TZPR+WQBsaAtf/ZDvbwPwBEr4Kgq0wjoaHQ09KnVb7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDnRdHs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCwN+FzF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597PtBS1973414
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=; b=pDnRdHs5lvUfpYdk
	Ud7E9GB+W2dPNMQO/F37Vuj4hfqhj/dnsPgXUigUgbsOozzEAotANNaANu2+epFV
	RZXk+ZcPNYW2muCs5isIcfRMowSvT8ovPCDdjGvQLfJ1fAlU2vDmP0d815XesRRc
	cEqYZgd4Ojg6gjoN18HGi0nTRx9ok2UBrBSV6TRnoovNF+dxD+9f9Rk8tWqeHaxS
	rxToI+W8CGDXDn5OOU9hNQ3hOkLV6VQC97yivM6z0UcRKs55eEXVJlQ7TmsDrkdb
	M4JeYKR0v0lrmSdYdrTrZTFD8zllT2t3jeSt57u4g8FDAM3mV34VZCPfafE/RJln
	/zyrtQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeear3ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:53:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178fc89b1bso66821691cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991614; x=1781596414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=LCwN+FzF1NDTmCN4MqqtO4+rM54cxcZasLV11jjMbK/7/kRTr3l8UQMclObpboCkw1
         ucCeNbVgNHpmPozxgT0zbSHD8dxxMXOWi09bAujOxlin73Mh8wYMeaGVE50DLvRKxa9F
         jsmn6gY5MdCl9tSucm+y4ex/yPHbat1XVdZCC56wqP5SuclL5wf3u91gquzflMtpfh09
         Sb2tTSgfQduJL6nr8VajlAku3GnxzuF7MlgiycrIS7KP3lUbapTWz6IdASN/trPNzmc0
         /bvAkn0LSgDWVaq4psl6qugBjxFhgxFCVZLfa8+ol+RN0dtxHffLHBg7FbxvzaCWFCB3
         IP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991614; x=1781596414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89sO1OgYR++yYy+u1B0OefM5OwzCUQ56NpmR1VFchJw=;
        b=fs3AZOnGMXHHdR+ZWM0GsUBzIO5gZJJE6LdfgjBier7RkmKfYCOYNuh1DKLO4KyoKE
         S45v+s94ooZU/eg8urbRgirmZjTxNGqLe7ih7S6gX9ccMyJH6ALt3ymROIxnpTWNYefe
         G4IZe8nDfinmoLAcXQdtVtvH8td/y7hkB2KBBKjWTppo/rxB/1WlGyfUEJNpamoVf/QN
         kY6AvmjVQMyYGj1idRmUZzT5w6p2ds9pJpjtkN4EV86f9j+rb2Rj1i/Y5KAN+FEjWYTj
         4aQ9ZSOYw2VdGllIAA4fn+t+pj2T7Z2pUv5zprMqCdaipxNrUQOY6iFekI7fc8FJ1iSo
         K4xA==
X-Forwarded-Encrypted: i=1; AFNElJ9QMloCKCwQ5OewjfzHGCBEPTxJ71c7IR0fNIuhvkiBUCwNlosukYXdScYi1fpQuNtzMfEXSOoZhR42qO1l@vger.kernel.org
X-Gm-Message-State: AOJu0YxCWUgQciT2ryeBjTLuRQ+h7+gDOG6eL07MoIYDsQGrybDXsQg4
	7RgegAqdbWoj9xwkt99vGxKR9XsjAwUNf5yq6Xi+1SGgwpReSQ8RSoTjGV8CtVehrS3TxfhjI/3
	riu/CPhtreHM+V9E9UCyby7zsjIpcu1cd79m6I44Oy2hwUJvEKrVFf/Bm2jkS9JCW8JFV
X-Gm-Gg: Acq92OEC58djZdxKqSHRXnPpcP5B9lk1AOQarAFL+guoEZpWxMSSN/xAY40tOoau31O
	3hiqKIS71c9kPkY2FnS8RiwAW6oWoPDlSqmtnzYpitSmmgchUtcT+BBqhRuvcprU+RsBErZoA9q
	kk2TF2Z7xm3U0vBB+m2I0+4T7ILxPEiXSQwS0Y164W7vgzOW4V8jJ2u6OWxtnDGhmJ9N9Eepth6
	Q+lgSWW+gsk/F68Vf7I8GiAmviaxY9YbXUn2bkdD2TFpWQWq5GbCKLbUR/NrUQSsFqkr1KLEsvP
	xNz7CZVKEGFEKTs8Iw8RFreQS1H6fcdmalDv6wzjXjYDk7oRdJICv+hfWr54xL1K18bNZ7SfAx7
	OxL7em4JnbJ39zf8p6Ag4RUjygz0KjpWqB/uiWt1Mq9x6e0Kw3aDH/27i/SJy+dfzy/NqrheCvA
	KtHMynxvx0hFsBbT3RmFpNfD3N3SSUy5eB02OqgHKbaQCsuYqCXPaEd41EjNpWzbLOzNtUGYACc
	tOTPB+U1GRt
X-Received: by 2002:ac8:5814:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-51795afed1bmr263903651cf.25.1780991614431;
        Tue, 09 Jun 2026 00:53:34 -0700 (PDT)
X-Received: by 2002:ac8:5814:0:b0:50f:bb77:a084 with SMTP id d75a77b69052e-51795afed1bmr263903141cf.25.1780991614000;
        Tue, 09 Jun 2026 00:53:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:32 +0200
Subject: [PATCH v4 7/8] Bluetooth: qca: Set NVMEM BD address quirks when
 address is invalid
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-7-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: XIwNejRaoKBf_aH_n2mZ3ZKLckjtRJWe
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27c67f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=99fXo_IpyjsNTNVBUdkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3MyBTYWx0ZWRfXzVnb022JGv91
 CLGjy4A+6ivKop+hDhAFrIbuXwyY2Gsd7fkZ4bCakxNPaKCXA8A/3H1sGw+Z7RSASng4pWPoJfG
 V02a8tmYh1OpMetWNZwe+frR5Y4bCbhbVzNgxWyvbzY90vBkT6FVJ07Ia2egPBE4QWz1cd2+Cc7
 +Q8PXul45xdpe1tlQp1iKkdY2RPB2vCI4b0HHfdsDP7QWjs9DcZtz01mfaMlhNqfUqWNUZwCTWM
 ShmctxW8VoqmVUk/JDbbdXljlQcrjKLw3raLTEDvPdo5/0zA75dTuqRsgzfOdbr7e4fQQLd11UA
 Fb1cLK8PcdKxDYYOBSQ5S6w4x8PpYKT1E3R82ZeXyb6l8g/PTgNFtD4Yhhw2+sm8g6PvonzDP20
 IpTS/2qvSobCkyThuEsT5T+3K7paBUcMT3dxTp0HrTugDT9V7GNIt6Xe0rXRSagEZ2c3KVxygES
 LA3bJNO+7BHOUILFwQw==
X-Proofpoint-GUID: XIwNejRaoKBf_aH_n2mZ3ZKLckjtRJWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112040-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB9FA65D7FC

When the controller BD address is invalid (zero or default),
set the NVMEM quirks to allow retrieving the address from a
'local-bd-address' NVMEM cell. The BD address is often stored
alongside the WiFi MAC address in big-endian format, so also
set the big-endian quirk.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/btqca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index dda76365726f0bfe0e80e05fe04859fa4f0592e1..df33eacfd29fa680f393f90215150743e6001d5b 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -721,8 +721,11 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
 	}
 
 	bda = (struct hci_rp_read_bd_addr *)skb->data;
-	if (!bacmp(&bda->bdaddr, &config->bdaddr))
+	if (!bacmp(&bda->bdaddr, &config->bdaddr)) {
 		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
+		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_NVMEM);
+		hci_set_quirk(hdev, HCI_QUIRK_BDADDR_NVMEM_BE);
+	}
 
 	kfree_skb(skb);
 

-- 
2.34.1


