Return-Path: <linux-arm-msm+bounces-102769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKiRL+YC2mlJxwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:14:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03F3DEEC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 10:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E266305DEF3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 08:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9BA330656;
	Sat, 11 Apr 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z60BCNC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dW7Rxj1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723A32FA2B
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775895144; cv=none; b=gJuuuzRl94eW/z8CDsF2HIvioPdYtLGT2hM5ewfnhKEucAbxAY6/8U1T60/Nxodrdov69G+8jJLHlX8+I7uGAmVoat8MI3dfso6xfrlOSl+ZElqasuxFH54HfQuJQRVrIfvzB+cxy+e+h8zYMI9VechdMOkzCy7mw5UxHrouVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775895144; c=relaxed/simple;
	bh=NyETwHthdW5B4gJ3ye9zxcWBwoooBXNdw7NK9RAuONA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aNsu3GPht4pdhcFuRmcfIe/rb94TpovVykWtgYWftq0yDiR1F8ehQrIT9bTt+ECZKI2MlqvT7oPO7Ik4g2x+nJvt854oUhAByCgY8alevhO2zViVcbmhbPt+0d0itnfsbcc1QweFc0AA1/6sOAbQ3pA6oQGI6EfQb1OKr9IPEBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z60BCNC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dW7Rxj1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B41MZB3377139
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSARH394vdmTGRvfEuayVkMEZyjI7Kf27FX8nEqxTwo=; b=Z60BCNC1Q3u77yho
	9crAJKE1Q69MsvNOEZChw76YTv8tyWmXKvUWdgObyYyBUclPnwkezIqOqN8bRo01
	jXMA5/kBcw3F+nKgFbPzyyoVy9XSrGNW+gOlpUEBZnzFeoLByPGhyvV3+DXfPSgV
	RfE70zLWS5Vx8Vmokaye85onJ90tiyLcCVF/+hT66nktAaT2BMtzPiP0dgY039e+
	5uusJGTxZTT3AMC1vefgvqswu4HcT0r/SV1EfYdcuC+JO+n3eUX/lZTvVHr3KwYK
	+Z6tsOGQV79hrWb0aHgG5zPVdOMOE/hFdSjM37INtGp7BFEmmIFA9Cfhf6jXw4O1
	+D0j7g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkrbya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:12:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7424d91b2dso1684079a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775895141; x=1776499941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSARH394vdmTGRvfEuayVkMEZyjI7Kf27FX8nEqxTwo=;
        b=dW7Rxj1C0ociDFettCNnril2LQRlTw6sJ3T8hZAs2O//1rdMufgHoBGj3HXau+sAZ+
         D4SS0pu9BvQam/k8co4MtpCIbh8KZeY7Umq3B9foNKQEBn4X4o8FK0N/IZxVfnlEZRcT
         YOjCyJYt4yyU6BUFckAvThRvKa07NdBFGU8Ej1nn6MjtCcyVQSpKRf8ldNMDT5mIdj+x
         zkTzl8U+/ejdwvLDFnc+UYPkYzZ9h3UGW7E1RVfhh/U8bdLmZ/aAMdh0EjwcAtZHwDsv
         53Ewq9k/4+45GEftby78PgMnpPz73PChOijd3LYK2E6GrQxcDD63rEeJCURFuxfwCwka
         hZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775895141; x=1776499941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XSARH394vdmTGRvfEuayVkMEZyjI7Kf27FX8nEqxTwo=;
        b=m6TeQ8cfYCqqkEmvTORmfvwYGyAgbULq1c8LtI4j6XY2GA2YLrTNz4DmJonfE0CtaO
         twTspMh2eK90QNsZUSHIifY6SjeQbFJQbsCoLuStyPBn6RPfFaaA1SzU8IkkYGGNiLPz
         n08QWQLnDBVawjWvHn7yyBUtxqbkIN/EqQ7b3K0kqEC1SDoj0xI9p27pVphXujt2cpnj
         NrGmbq16sRdKuDQtgm7ep0C/gkD4bSMpJmrD09lNLNAAFOOpl5Ee7VlLkeynK6nRCJSy
         FuPt6/YMHtttWhzzPxGBfMLhggzaIhTQi5LbQsiK1jsekqBMzdkHkqmQuXEc4dXtOHXR
         EJvw==
X-Forwarded-Encrypted: i=1; AJvYcCXvEcnj0KABM3y5TEsayY4iuq9SxyTcjUvbcy3SL4wxCmH13su4ANtWiQnVSajfpg0PvkswbIS63q4gyfhz@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEufFW2tTMLi0rWI7RRWAQliHbOms410lYmXoiH3Fq9E8lBCp
	SRjvd6VsvT734XGwki3r/8fChXYX0G8CG8a1UoXZ2bzZdcIWVOgsVslaRG0ehcrdz1HoRO2ssrM
	FNiwMz523rNN6H9C2SMFsD0WGKVQ//YrkOgjZoPEncwnkW4ZhOIoEZwDUVzUX4jWG5Eth
X-Gm-Gg: AeBDiesVyxWroNKLGrnFiUvbz13CXDVO+lgNJtK9au5+xQIcnOOvw6pI3vGOPm3A5B/
	E/JIBWrC27Aq8jHmQQXPDdi1TlDRcdclTmGiVB5m7bl2nCh29ya84neOsxkgrxSdCrzHTB1Ulte
	YbmEnK58ReVYPcPJCLkhuSkUe/eIICrF/ITmuMycKuwpUWaAFQnFcJd0N517fa+GLp3AhDwyUXv
	6/R4gG1+wNLMR/4e0lhKITd83k+EJ9JPeH9LXCRyVzmh4IoxeFFJpXIu15wFk6c2JANqEabcEvr
	C4LiWPvnorp0zgJtmkJx2eOrDB6QiXy1MDeuQInKqM9tdeabc53VP9YWnktHtUFW/auK8U8dC7c
	lHspVPcyeNR/BWywYJD9SSftJKE8v2isuo4XKYh7rRT1Yv8FG78czK/cW
X-Received: by 2002:a05:6a00:bc0b:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f0c1880b9mr6659873b3a.23.1775895140738;
        Sat, 11 Apr 2026 01:12:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:bc0b:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f0c1880b9mr6659854b3a.23.1775895140289;
        Sat, 11 Apr 2026 01:12:20 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm5410996b3a.2.2026.04.11.01.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:12:20 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 13:42:03 +0530
Subject: [PATCH v2 3/6] bus: mhi: host: Add support for 64bit register
 reads and writes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-tsc_timesync-v2-3-6f25f72987b3@oss.qualcomm.com>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
In-Reply-To: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775895126; l=2553;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=NyETwHthdW5B4gJ3ye9zxcWBwoooBXNdw7NK9RAuONA=;
 b=fzBR2FV+F3XnecGKYRPZlKo0IWNSLXZs/Cz9LeprB0uOkdNN4mKqj1lNnk5QyDox4nicuKvMv
 8g1HHNhdsNABQD8a1WisyzGiEY040BMRRNjF92CJ4fv6nhTORsow/mr
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69da0266 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8tVK0NU1EB3xojDYR3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA2MiBTYWx0ZWRfX/8po2Q3rNz8d
 9kC8cVMS5VvYFMTgWavJ/5f7Zj2dF4Tv/HBpExWvroo0SrNQpmx6t+R/qupVkL0ElX7aCYMq7UY
 3toYZa66HBVn+TonY2HiR1qrgFho9P1+Y46N397EPfGMTmDhWSQQkhfyKWx3AtCrVcBc4SSVfQ4
 NafYLtTuFJVc+Qk1bBAGgK2IrOYs03G7JnqyTu26/EpL1dt69S1caIa4Qyp2Ge1Vj9mpL1rkb7Q
 kEZ1N02SgnCKvfPFBIGSzgUh2kDj3UT+T4xcK8lNfpf7dYOdTrIlhMYxoXzh1QqhSKjW45VJ4Ps
 s9rXU8FlKR2Lyi6GHpnd49lUFCyY0cOJnQQrcRoaRu3ZFC0Ea4cLr0Ao+jLJCvFEuWt7mjIOjjN
 MdXwPrvFsbcBZdwJ2HHO/wLy2JSyGNPXqf+Jz+eChRBIsP7FTqpNt1nzP6Jo+9szgslt3W0EqFF
 SabuDER4Jcze+A4W0Hw==
X-Proofpoint-ORIG-GUID: LQFiVFy5MdWNdFNK42wJxRqTigY_Tg5G
X-Proofpoint-GUID: LQFiVFy5MdWNdFNK42wJxRqTigY_Tg5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102769-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D03F3DEEC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some mhi registers are of 64 bit size, instead of reading high value
and low value separately provide a new function op to read & write to
64 bit register.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/bus/mhi/host/main.c | 12 ++++++++++++
 include/linux/mhi.h         |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index b7a727b1a5d1f20b570c62707a991ec5b85bfec7..99917593e1da06f1dece7b5b0037c2485953410f 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -67,6 +67,18 @@ void mhi_write_reg(struct mhi_controller *mhi_cntrl, void __iomem *base,
 	mhi_cntrl->write_reg(mhi_cntrl, base + offset, val);
 }
 
+static int __must_check mhi_read_reg64(struct mhi_controller *mhi_cntrl,
+				       void __iomem *base, u32 offset, u64 *out)
+{
+	return mhi_cntrl->read_reg64(mhi_cntrl, base + offset, out);
+}
+
+static void __maybe_unused mhi_write_reg64(struct mhi_controller *mhi_cntrl, void __iomem *base,
+					   u32 offset, u64 val)
+{
+	mhi_cntrl->write_reg64(mhi_cntrl, base + offset, val);
+}
+
 int __must_check mhi_write_reg_field(struct mhi_controller *mhi_cntrl,
 				     void __iomem *base, u32 offset, u32 mask,
 				     u32 val)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index f39c8ca7c251954f2d83c1227d206b600b88c75f..8e7257a9c907fb03571a86e29db5534f492678c7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -376,6 +376,8 @@ struct mhi_timesync_info {
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
+ * @read_reg64: Read a 64 bit MHI register via the physical link (optional)
+ * @write_reg64: Write a 64 bit MHI register via the physical link (optional)
  * @reset: Controller specific reset function (optional)
  * @edl_trigger: CB function to trigger EDL mode (optional)
  * @buffer_len: Bounce buffer length
@@ -462,6 +464,10 @@ struct mhi_controller {
 			u32 *out);
 	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 			  u32 val);
+	int (*read_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			  u64 *out);
+	void (*write_reg64)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
+			    u64 val);
 	void (*reset)(struct mhi_controller *mhi_cntrl);
 	int (*edl_trigger)(struct mhi_controller *mhi_cntrl);
 

-- 
2.34.1


