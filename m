Return-Path: <linux-arm-msm+bounces-114601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5XRkEBANPmq4/AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD66CA520
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 07:24:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y4Jt5Qbj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d6fEV1CE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114601-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114601-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A8EEE305ED1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 05:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C994F3A984F;
	Fri, 26 Jun 2026 05:20:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710583A9626
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782451210; cv=none; b=JHBvtgx4dofDeohm1b6DDUJZO7fpVuFiCrQ3InLQ3q+06kcqBxAsqD5Up51fOKOBAsYf9mV0WjSNoB8txQJFLBm9rk7KrVUQ5c1c5eqt9RhMec2NuS5wPIg4Ctov3Jz8kt20BYok36aYB1fV0hCxhsYEF920LRAoJSjvNbIcB7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782451210; c=relaxed/simple;
	bh=WKgBK9QgtyJcI0h2tkQjPicZvAZwBNsQSOOoAXpALN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLLO6+Y1+W+m39AoB/TaL0dagaDpzAG9fhbJcIfHTwVQDPd6rgQX1VaWZB+TMit0MjspaSVtBOy5wpuwdtvRJOZJeRYHE0ZimdGEYANzlPHRVuv4B9ldyxk5BfNa69H5Y31f3Py9tQQ8Rc4WuVSmvPh6GT4ecMwAygQj8wcdXco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4Jt5Qbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6fEV1CE; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2idwv4003975
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9eQxVHI0s6IYSxZbSFmI7Yut85fEmi4YSANEBHXsji4=; b=Y4Jt5QbjF/5P/INL
	n0QLmmov4PLiyn8UrlsabG5AEGxyBK8aeAZ1LOXJD0zn0zJqEQIJPZEU4NPMmEFD
	L9ndMGLSoBGaF3sA15ZIz+FyOzR76Ak1mF574fRw9mgppDPci2S76Knn7ye4k7dt
	RZVoMbpSBqMhoCPg8ib881zhmNfekZ3wgGW1G5/ZgO4q/AVHWqmwVV96CFhwB0t4
	/wjBn5e+DBJ6DmhLyYpIqFu42TUo1nrGW2tA8ORNzCuaFnoVuvScm9QSvYcnTU5h
	Qn1b6JXu4Kh+sEU+LZIASJdGBjZXjnm2UDbbB34x7+7dviesem6yGnhzsiKlRhGw
	YMbipg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeq93f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 05:20:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bd2951238so64912eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782451207; x=1783056007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9eQxVHI0s6IYSxZbSFmI7Yut85fEmi4YSANEBHXsji4=;
        b=d6fEV1CE6Dfibm+itlBHVzPQkSGRUTShUavtCIz4GjofQUYUY3lHOAV/0ONyaOitjl
         6O08WLOrqn94M/EkgI15QnBYtQ8++aKodoqc+8Bo0i6KZHJ2Fx6D8/i/Dh4JaJvF1+1K
         Jutecj8pUVpkpi5hdB/pbYhP+eFzX+2TV68OZn0eWewp8/eSAVVKAbnYVkV0hpvszBwk
         EANB8oADM4ZxJmuaU5NN+opBqMcCM5ZTcKbiHSmGbe/TCbQ1yfoD6m5nD3MAuyA1jOcc
         m78Gs+Qg+y3zgoDUxVqt0EU2DFRro8/j6Dh5OenvaZ+VTLvfvL2WfyaYWW93NxjdaLch
         DaSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782451207; x=1783056007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eQxVHI0s6IYSxZbSFmI7Yut85fEmi4YSANEBHXsji4=;
        b=sgDUn/mL6Kn88iU28AAaxL0/VIsOvZgEGIB8VTCryZqmLDSBVlDDeNsCdndmeCmlio
         BoV3d5l4yA/bj24BkempYPHfgN2ubQpXmhpYwz+WLNdh56MGb5AZSnTHd88aITL9DyRX
         mRW6Esj7XJpOuCb2JDZWlRit0P1Qbh9Q4RopGcryYE5jQAtImKmLc6O7n6CFri1HPNGr
         hX1ULI1VMF0QQEOoLQyP4NloMHfMwYRYqsoo1ashGNS4UoIiS4PT3pbh54yHylgG5+i1
         sWiZwE04zIaidM6lxTFnjiJVYwhVLiOo/Vfb2SJJ43yf1mnee0NRL3OQAG37gaj+zRmZ
         RfzA==
X-Forwarded-Encrypted: i=1; AHgh+RrwNhC8Br65tYgI7RU9/TZ0P6k4BJS+/CyLPgeemJb6dWXK6+jxG0ey/syT0+EVCz8ivow1/L6K9Je7/LKK@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZ53hzz7XNma8n96GALfka7KrYUQtwh327r9yNl+buHt0adkq
	XrKUqLXscMhH7Bul9LSRgyy8E5UK+WYRCs9+LmySykrt+bozy9hELgeTVNeRXV/ZtReqbvuc1rO
	YcBKSSjGtCBrKpDIwQuElQdV84Qb1kf2diLdoh5gRLkO1e5t0iSHgICWpTXUaxaKeP0Ez
X-Gm-Gg: AfdE7cljl1jpeVrgcHqalWEBIKJzC4t18yGc7sM+v2iPN9/qd75RVevjQtW9Lw8Zea4
	+E36TB4FKA5rbRa5tmJufnLd9sD+C4NW9j5qoQYUMCfofLUWff5p6SnziiC+JfeM8LUJp6vn2b4
	Z5ubsGZuY2hGyvz+eG4hMek2L9sVddr+A/rN0K69Nfdk2u3K3pJXA+YjNR3iIfuq1IapvSg7tPS
	toBMI/8tYSlSCBvCOOBXNwa/SvgnP3kEkq6FpF/9tzrQOyOf9Ic645VBlbuDuEiy5QGypSUkQEU
	tmHFQtgRil/9ZZyuSDcxRJWMJO2M0q7qprrQ27P5kF3DP5Db0jN02/nOPKb3Z/GqVihpxyFKwIv
	AR8tvRNS7kED4M5dyemZwdGq2VBDOM431YybDLqNMwJCH0mvf6GataEPJOA==
X-Received: by 2002:a05:7300:d517:b0:30c:5197:3a09 with SMTP id 5a478bee46e88-30c84d5fea7mr2312224eec.7.1782451207318;
        Thu, 25 Jun 2026 22:20:07 -0700 (PDT)
X-Received: by 2002:a05:7300:d517:b0:30c:5197:3a09 with SMTP id 5a478bee46e88-30c84d5fea7mr2312195eec.7.1782451206771;
        Thu, 25 Jun 2026 22:20:06 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca240sm14345291eec.4.2026.06.25.22.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:20:05 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 22:19:57 -0700
Subject: [PATCH v2 12/12] Bluetooth: btusb: Use & instead of == to test
 bitflag BTUSB_IGNORE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-bt_bugfix-v2-12-93396a6f7d5e@oss.qualcomm.com>
References: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
In-Reply-To: <20260625-bt_bugfix-v2-0-93396a6f7d5e@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Tim Jiang <quic_tjiang@quicinc.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX2WO2rrCeIF9j
 pVx0jp4AWMHW5gO/Ax3XRU1eiNp2cTQND7C+wIDpSWj+rvtfzoyj4d8TXyi2sqAtJe26pg0rtHc
 WFndoLnf2eTSw6nCSjzsQ/5ogsxZexQZ5K4iUH9C4rV6fPp4nQI+vhLJq5swYbKSF6EPKPaw4in
 F/VRYIoRj0hvTY+GwjPLwn8i35vDPMFJ+tz8aW1dAEn23CWwIWc9RYP2rDZn8kXp2f9P++EVTAw
 fH/cH3500THL67uQP+qhVZ3sF4bqYQg0I+GHfI5NTDLsEaPWdOdhWDo+J/cx0qskLSwLCM14ill
 pfMmLlfhyYI0SowPa4BBKh9UuoiD9uUXFWIuKNHzOeF2wSoP+MpB6vVZjC9+O0W5xet1RvLTxhi
 P/WfVFt0hdsSkQGJ+EGadgBUcPNukkP87X6KlSwY2cvfMtEMOyMLNXG26v7FdQr6mov8C3EJg1h
 Eiuys15Unums6KZ8suw==
X-Proofpoint-ORIG-GUID: 1GHV07gYtALGSXd1ie08gsiSrhpAkY4O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA0MCBTYWx0ZWRfX/pO0IGMTK70C
 FKYOtrsGMU+rZs8HTdxI1NjY0TkI7gV7iCSrhD9Wq0nNwx+03i5IJDCPhrF7QtiH4D6ARGOa8Xm
 TApIRvn+fmzG4DRKtaJMuVXaddplzYs=
X-Proofpoint-GUID: 1GHV07gYtALGSXd1ie08gsiSrhpAkY4O
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3e0c08 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=HKrVEy9w7v3RiqOSl70A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114601-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:brgl@kernel.org,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:quic_tjiang@quicinc.com,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:zijun.hu@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,quicinc.com,kernel.org,qca.qualcomm.com,chromium.org];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBBD66CA520

The driver_info field is a bitmask, so use & instead of == to test the
BTUSB_IGNORE bitflag against it, which is consistent with how the other
flags are tested.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index d2e15a91584f..21e125db1b1f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -4109,7 +4109,7 @@ static int btusb_probe(struct usb_interface *intf,
 			id = match;
 	}
 
-	if (id->driver_info == BTUSB_IGNORE)
+	if (id->driver_info & BTUSB_IGNORE)
 		return -ENODEV;
 
 	if (id->driver_info & BTUSB_ATH3012) {

-- 
2.34.1


