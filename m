Return-Path: <linux-arm-msm+bounces-92857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDU4BmTmkGnodgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:17:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A09C413D44E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0F9B300DCE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 21:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0389A2F5487;
	Sat, 14 Feb 2026 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzlUOKC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SEv3iWNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1A924E4B4
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771103831; cv=none; b=cXvES3DUTZU5rw0U65CIgyu9+iwe8ASXiq0RWjBcC3UEp7l/H3U2ij5YZhJFBFJvuevdq/TYsATkgne0ibvGpgY2GqfcZtnF9isW1Vg8D0Bf7uijp2ShCb6tu4vCHbJ1/hwHB76lh/PyDxRILjuTweJdCijO0RfoSj79noDr2eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771103831; c=relaxed/simple;
	bh=RN+aHlYWeP7SS3/oVVlw9OOZL5W4/w1S8wzjWy8RLxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+CnBprfFHzynWwwL8q6cfkzmehyE9zYqJy0BjWK32B3ZUqO4xfX9zYuiaCvUdIx3H0C8T+5vOAWxkjk4h0YE5rzgl4NBh5MJq6JOIMCvMOHyOImvpJXcu0t4qRfK0hv0sl+wZF0042btm9BLGPQ2OH/UIc+aZ0uxz0gFHyVlxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzlUOKC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SEv3iWNj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EJNHmh3292124
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQdos+TAnRmSkCdr5GnlxvkkXRXMSBu+4jEUKE35sLU=; b=dzlUOKC0IkOaH+mY
	S+Y3ay6kn5pvtvy72inwC7T2zQcVWuKVp1DBOdigXtxVq1Y3xEOW8IL4cqiMXzNX
	62ugzhHbODCulpAFtYabbTNiAta+P5rIZ0F8glZD6CpgwD/LmbuMvdks5SOMZiSv
	CT5NHYg3fBgKh6PP9aGB1QupSXWUKMJ+NqmYFIirYqDPf0PK8fjh3VZEFas5fn1E
	VWe/DQm/FAHLdkGUlWRC5FDNOqeUoKzZliAlk9fdpz8wNvD5p1dKIjiFSSHorjX7
	oGpvwnaslBrirO3KU6sTtWcprSadoBa+bdMQCBe7WnhK2U+wXIAJon7LF2hrS/gc
	Q47g/Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf1f82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:09 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4639e1fedcbso13613757b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 13:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771103829; x=1771708629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQdos+TAnRmSkCdr5GnlxvkkXRXMSBu+4jEUKE35sLU=;
        b=SEv3iWNjeyU6cLf1r7niXCZdFIHUfFPkz2RS8zSJBc7lzJPXvfMaZLwq1vbh86uKyc
         ipcEOPDKAD5ChYIP891gQi8LF1MU7OX7MPi135obBEdMmDcrVxMjrIFdVmI+3wuLCw5w
         nkmwNFkUSoZApu+x2jYF7BQW80C2bpifQrc7PgxYngeDjlAitv+YDGtTJZPFUNMBmegg
         KYIMtxGlaiz/NzAbSdEMPMmQ5rRtbxBotEKbPVBp5K0gXOn7MLadNURt2EcFdFYkzqrO
         585NOJOU8NH55Q36iAzj/hKcpPXyr6ABmrGrH2nr+tUnueWLyq1ACUhfk2tnUReqEEbH
         ZTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771103829; x=1771708629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XQdos+TAnRmSkCdr5GnlxvkkXRXMSBu+4jEUKE35sLU=;
        b=u96RDiPUgpAikCFXUydIOvak2JFZAZoBsXqKMVMMmplcDGL86nuM+9fxC+Rjefw438
         c2m6znmqW6/2d3wpgyy27ZCW6ngw/Rj4Lq+LmWchjOSZ4nxICy/o7fwpcBo9DKmgW3y0
         /bDpvej/SW/Romx8SXJkvBQJBg4Uj/eRuZFWQH37Dc5PauhTulQSnn153BLbNw/uFac1
         tj5gIK28ViRwEE20rOmm918ea75PUAnS8QpfBVDwDE32mepri33R+Z1n6cpyQAlkgKHU
         l56kOvFvSFDL9n8fFESxABAOhR4fHGB46HH1itpuRD8VcEvOpvRdnHucy/iblVfAiRru
         d58w==
X-Gm-Message-State: AOJu0YyhFh2lhm3U8/McpkBlogYUzkUktkF/L1IQO6Es5+3wE2conHYW
	gIrCDzVxwqSLYNKwKvZ3R/a/Ec3464jp0DDD7ogbGm3GeRRmPemDDwrKmZ5SSpWn1olFkim/cmn
	1ZVJSs72sYQtCmrbrcVhJIXjig1lkGLR7cNxuNvge/7C2l7+zuZlDLKdsxd7hsjQEqldb
X-Gm-Gg: AZuq6aKI6W6p8UJq/J/7uCTBeJnYLiX94Qa4IWXnH9kuviss0uJLp9XM1oLpaszW73x
	NWBmTHWMqpjrok1iLaD0Gy4Y4PlqZHvsuURY3H2QmaAhRzuFC/Etk98AAaZ+6lK91sZ1fZPkYZA
	ktSL4F7WpLSu3ys9Wf/wBfPy+/wHe1rpqF0O059Jw8V099T8UtELQV6QY8Iz0WhDs+tRxZQy9aT
	oTYB4Nc9gF6fGVr3X6+jOHTBJYPrfvIk5EeYmhFRFZOj6etCZSatbkIuBEItofBNdCGpHwERQkK
	8ECFtkIrjT5Rm0QcSwneUTc8+pav4wMdV3dteImY4sF9qKMwq/vdbnisGEC1jdUAWCv8fix9Ib5
	EZSV2QAs5FOJqOsx3ygZ+JxuF4xzJ+xXWs6vOmgyyIRPjLU3yZ8hk/Fyw10g6ae92req5Aespix
	ONuA+JY35Jl4N6Viy7xQvE
X-Received: by 2002:a05:6830:2708:b0:7af:1d61:1055 with SMTP id 46e09a7af769-7d4c4ade32emr3270983a34.21.1771103829020;
        Sat, 14 Feb 2026 13:17:09 -0800 (PST)
X-Received: by 2002:a05:6830:2708:b0:7af:1d61:1055 with SMTP id 46e09a7af769-7d4c4ade32emr3270969a34.21.1771103828650;
        Sat, 14 Feb 2026 13:17:08 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4b9f04181sm5913130a34.5.2026.02.14.13.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 13:17:08 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 15:16:56 -0600
Subject: [PATCH 2/2] soc: qcom: qmi: Avoid splatting the "length"
 destination field
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-qmi-encode-invalid-length-v1-2-780cb4e98b0f@oss.qualcomm.com>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
In-Reply-To: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=RN+aHlYWeP7SS3/oVVlw9OOZL5W4/w1S8wzjWy8RLxE=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpkOZSJVQoFbe6FI9cqT5sDIILdWioSppBAd2Q7
 c0jvv6jyT6JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaZDmUhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUOcBAAkDJUc2Y5MHrRXH8LtjoC6ojSUpIgfXUGvEbEmkP
 DcGwxOY0lhVj93PrKr6DX4FL6Wmb10iwBmbaL4HbPCLfBxysfkx9MqJvIydrERXuexoL19GxydZ
 fDXihWK5Ypauqh4nKhWRTVxKoU+Qji/88jPMw+suuYbsaYasDcnkQwHvuMfnlscOANx99PNuyF1
 AW8Jc4aKa/KAgDseZWHryLGHH1Xpqj0SR1cjQEznKiIERK/6cFAtwibyDRv/daXxlP+Gz5I873a
 tLroGBF5A44JWSRKnyvkjMcczqWzabZ8/PHKnDQU/g61xFZHUufC1Ato4Vmq05RKbDRGWOoYQu7
 whVEguqd/TL7jIZetJp645CynCG06suINWfV48u5xsag3HvMFOThvJBx278QzA8sKR58jwiwJEO
 laQSXJbtNz2YxolKf92EC8ZVO5heAhU+HQBbHEFjcSvNhrN2PzAmFTlV6yg2/CM4eCH412L9vyB
 QH5j75kGMIpNgJfjOyKL4pqJbtF6iUeXpD/l5294E5j6C3O30EB3ar+x0xepXKAnL1WlYjAkN5I
 8N6AADcO2T0OLQI8D2Xk9QFJE7/tiBByv5Rm8AfSi65IlRJPO25c/GMJNsTNLTjtgSxve/OkjC6
 1AyQtN5UxyXoPOUNJxGnEevN8kVXxHRQ7UA/E9WXl7/k=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: g40hkMU3F6SQQ2q1iaO-3FvISDmeAHJm
X-Proofpoint-ORIG-GUID: g40hkMU3F6SQQ2q1iaO-3FvISDmeAHJm
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6990e655 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=PR-xUDRRZIJ0Fs8gPngA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDE3OCBTYWx0ZWRfX2BqeveFYrYVb
 WiDISf5uF3ADAin49XgjEZFgnzPG5ng9yjo/U9Q4DjEp6j1onx6RWQ77PtW8gqHcfyCofHBdRnG
 fKiHQ7rGOqcEk5ZDbaVj4sfsJtcgwOGZfwvl6Q5QTEyIZL75jD/TVKYAf2mjVKsW09qKbor/rUu
 QxnK3L5FUaipJwK1SCZlvdD+Ij9BD2bWHUpGyXngLh9OeexZZeckfOUA5ughbpTQ4YlrLmHAQ4a
 RrwZEvpB3IH+O4skkSgL+2ujXUWZ0iVIaFGlae7dCmHGi6d5bFiDp9siTtl+foJZnjLmEBvA/ek
 LQvuEWD6ypTStDBLsWcDbmYt21elz0sZmWjAE7jnIiw7vmo+LCxkz9SSxK9ruc5JmL4JtNbRGql
 mMgIXAuoykkIZlyPV/JHX4z5pq7YTjcn1tu6BvdWbumQvuod/NR+YzAqvMvyRK0ArhIx4kQOLxx
 5GIbp8IZPKiPoPVqr9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92857-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A09C413D44E
X-Rspamd-Action: no action

When decoding a variable-length element from a QMI message the length is
either a u8 or u16 field in the destination C-struct, but the current
implementation prepares the value on the stack and then writes out a
whole word.

In a little endian system, this results in the following 2 or 3 bytes
being zeroed out, and then presumably overwritten by the actual payload.
So unless the length field is followed by an unreasonably short array,
the splat is contained - but unnecessary.

While not verified, in a big endian system, the length should end up
beyond the length field, resulting in a 0-length value with "garbage" in
the payload.

Given the expectation that the QMI message is decoded into the naturally
aligned byte or short-sized length, we can simply read the
endian-correct length back from the destination buffer and use this for
further processing.

Fixes: fe099c387e06 ("soc: qcom: preserve CPU endianness for QMI_DATA_LEN")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/qmi_encdec.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 45bb26d010da77ab8d481897026b718c2290bad7..149af7f7c9833e1f3501f96c989ce9bd58ccb8a0 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -712,8 +712,6 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 	u32 decoded_bytes = 0;
 	const void *buf_src = in_buf;
 	int rc;
-	u8 val8;
-	u16 val16;
 
 	while (decoded_bytes < in_buf_len) {
 		if (dec_level >= 2 && temp_ei->data_type == QMI_EOTI)
@@ -752,20 +750,16 @@ static int qmi_decode(const struct qmi_elem_info *ei_array, void *out_c_struct,
 		if (temp_ei->data_type == QMI_DATA_LEN) {
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
-			if (data_len_sz == sizeof(u8)) {
-				rc = qmi_decode_basic_elem(&val8, buf_src,
-							   1, data_len_sz);
-				if (rc < 0)
-					return rc;
-				data_len_value = (u32)val8;
-			} else {
-				rc = qmi_decode_basic_elem(&val16, buf_src,
-							   1, data_len_sz);
-				if (rc < 0)
-					return rc;
-				data_len_value = (u32)val16;
-			}
-			memcpy(buf_dst, &data_len_value, sizeof(u32));
+
+			rc = qmi_decode_basic_elem(buf_dst, buf_src, 1, data_len_sz);
+			if (rc < 0)
+				return rc;
+
+			if (data_len_sz == sizeof(u8))
+				data_len_value = *(u8 *)buf_dst;
+			else
+				data_len_value = *(u16 *)buf_dst;
+
 			temp_ei = temp_ei + 1;
 			buf_dst = out_c_struct + temp_ei->offset;
 			tlv_len -= data_len_sz;

-- 
2.51.0


