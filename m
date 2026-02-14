Return-Path: <linux-arm-msm+bounces-92856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEOCCmTmkGnodgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:17:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7BD13D44D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 22:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07F16301C6E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 21:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCE42E5B19;
	Sat, 14 Feb 2026 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POuESY1V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L58BO45S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E74241665
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771103831; cv=none; b=Z6VzxiDkP3cHdWr9E3Kg4oVgiSSoKHgXUJ7YHZEuoqILsTeVgdSiMpdDEeKc7QheT2q+g4CT8ONpAP1uC3Ot5rSY7L4UZGFm4LToe0CCQF6Wt7WXipJwcUXj7U7jwAeuiQk0r0ccdzYSDwrARyWQ60whbrVY6VYXbFpo7c/Mi2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771103831; c=relaxed/simple;
	bh=rR7UOXuskvM2eh7DaNLWZK2oGGwiqf0qUS4zowk/jVM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhwfJuby0HN2QNuNQvoS9iuR41/rqR7Cyf7SpBuswZ/G6SAQGOfHYWs464/Z2YrrSxhS15jQAgfG4XkeQ1f4d9D2oER6ULO0V+INDvqw2CD0+KWdM3Y1vA6nvE//Nh5srb/b0oftVAtAPTlnB52vtfR8Yn/02iNCEkFMGS6ARas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POuESY1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L58BO45S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EF9Uhe3565612
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6sEwMUAcPV8okvfCQy4lq+fUCd6uTma93Xlp51+1dI=; b=POuESY1VkCgC29rm
	sfywsl7kZMjF8E64xkr7LuM0hPsdUhN3fsjpKfhbEk6D4BZP3kemAMBkUsU8w/lg
	LzyrvWLlLLH84Hiu/drJ1FojQbDCSQoUzRZ9hif8pVl8gkB4pFBsHY0ycJdL0MFY
	f/PfikQooGRuMydbfUZydyDHS9MM1SG9YAmt2dm4KNAJXkCAEgnimAifk+QKwSH/
	uelPCWH1JNQQNiA3V6SoIpFuGpFW8MU2gF3QAFiZdjLF0mltVPPEhSXwV1rd01P5
	qqv6/Ntx/PDS7Y/21e8AJtkFnNejA0YcDWy80e+I15TdmT2VAyMWod9bdmFPgbUB
	AX5n1g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4shc8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 21:17:09 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4d6edec7eso2455679a34.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Feb 2026 13:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771103829; x=1771708629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6sEwMUAcPV8okvfCQy4lq+fUCd6uTma93Xlp51+1dI=;
        b=L58BO45SkIZZAN84FLeGiAJRZI7EHXFIy3d2s7aSRpk57yNr3+vUunTQRT/P/Xn499
         lFEeuEy/m3yrXS6i5HuPYpBuh4Qu3cv181gXjPaRn2veaVUsvaXZgbYTQRM46zR9O0mn
         8VT1giuhT1FyQe8s/wW2YBXL7UKb8LmTsh136P8w1xc3zzOCOZkMhjhma9YGkcbrlfyJ
         jHABRNSVujfuqjmercQe8kxUFvGJ/kDkh+59Bl0p8TcGFxR5IpkGXNBN02exPk52FQGu
         IrNeU1OPI5Rah0eMoxiMKoYAazXlvQQ3Uz4cqqKf09EpN6G0v+gLC5nAfT6T5GlZm9TP
         5cqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771103829; x=1771708629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6sEwMUAcPV8okvfCQy4lq+fUCd6uTma93Xlp51+1dI=;
        b=ub9vsO+OsK8ciY39YkFcNGEEnhhRynwYuTk9wLFxQ1HFAJVfkjwxAGHVV7Xvq+2oxk
         3NtTnsiQ3bOvTm4CFESb2ouaICcu/BvEJX7tCFc6nj5LW9xqNdSojd1V60+LJ6nfXWXM
         ybdkisGFW7659BAriGuuECQo+/Q0fCNc9cCkuJJ8dOdZVB61GG4luhJV4hC3grd4t8v+
         MK1ABlXBCSse1gSWU5TH9grVNe5s5hDajJVH91yJmxq9E5j3MxkWb2RlkRtW0TJTQrwR
         /1TktqfxhCfuUtch2WZUgPL7D1iTa3WGJFFG2ajXxiZU96GyUc6EaoSO1/e1mzaQ7bRP
         3Jhw==
X-Gm-Message-State: AOJu0YyfDRHkdWXk69DbkdehIpfkEA2mkWIVblZMymk1LIOvLfwxLxD8
	N0Pd8jKVd/uA9whonkBTMIe/Sg2nMwexbkg7eaCVxC+lRXYkhqQvXVj07dB/JQuOz5m4iRLEkaR
	GMitEVSPySaaCK7Nn+4uenZAPEjEghYYuAszycCg00nCkB2JAKpixti7zR9WDqzoGHFW5
X-Gm-Gg: AZuq6aI5EaswMqXyBvJw2eqWAohfJnwqKNV5ztyGkcA6kgZ+Nl1l+zKUX0rWN52b4vF
	1mlcEtAgrXekJL4F3r6KjnT5J6d0vu6CbzuyKKHHCt+HwfNxcPuls6P2GIJvfF0BZqIT8BOeyLH
	A/5FE58uZZtCr637ipiuDH66kerL6ym2A47ue1epoQGdxKiSfWPuvAnN7L8GHDWyr7sjWkgRNrE
	Uy329V2EfJLOe8Z2iTzjUZmBS2LvLv7+ZrPYh3xCtJiIkbmHV6ahKJZucNCE4QB22tJa0gOSEIK
	Aw+5lKJElHJ/WwDRnNbsrEUniCr0Djx3o0xwzJ4bPtw+RdRsurivyH0YZRAZ+xWMq/RWgmzl0K5
	+gnY+8wOeMXydJDYcR/JD+jVGnr/nZJI9jMgYVOBi5U4qGt8PAOPJGcQ22KVhTlo/8tAKvTMqFc
	poFfkVOy6u7Dg2FGieve2T
X-Received: by 2002:a05:6830:7316:b0:7cf:cb09:b7e8 with SMTP id 46e09a7af769-7d4d0c799b7mr1865476a34.36.1771103828525;
        Sat, 14 Feb 2026 13:17:08 -0800 (PST)
X-Received: by 2002:a05:6830:7316:b0:7cf:cb09:b7e8 with SMTP id 46e09a7af769-7d4d0c799b7mr1865463a34.36.1771103828043;
        Sat, 14 Feb 2026 13:17:08 -0800 (PST)
Received: from [192.168.86.59] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4b9f04181sm5913130a34.5.2026.02.14.13.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 13:17:07 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sat, 14 Feb 2026 15:16:55 -0600
Subject: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
In-Reply-To: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3316;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=rR7UOXuskvM2eh7DaNLWZK2oGGwiqf0qUS4zowk/jVM=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpkOZSg3Nja1vsNjNboG/+VRKxXqvv3IolYcAcS
 vi7E6E+k32JAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaZDmUhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWSXxAAyKaM/47AhyTIFa2HYrJ2DNmlZ55B1hsB3qwic7f
 rdNPE8ViXJPgluoL1JzVY6ncaTGgCnLx9CrGgUBZPmLSLrY/5DrJyIjuZe1nXpvh/5xVun5CxXs
 DDivQNPpQiqbIQsX9x5nv/vB4nh+fV+ZC9pvkDGUxJoLVtcdFxdKfleGPux+31sSYonUUUAzWqs
 qM5yHKid1eNMj9pzQsNe0OvQ56hYeWMJXrGfOyxuTtJabCiQHqbyNwmTkxhrSbJOTFUewirxJRq
 qd2kwXpZYEOF1YxhOQfPvCoDVBAtLwMtnME867KS+aFfWcmjt1shFgerTrH00uMGtJfn9hoBPkZ
 Lehy92iPJV8DdXcQMhKiTwAlDWy3uK1cRJNe6RvRcA1oDaVFD9ByR6p0NsM3JgtHLsgK7w2KBlW
 oYbWq3LwNNEauEmDXyf0NuZi4kpiIRz+oJmJgPLXaH+7FO78GJyfmiWb9nBhAljQfl6VGZxr9KG
 hqF1UoX+bDJEzCCndIZ0CIrTd1ih1LnuDf1FD89y1VzZTl5dJJDXaRfSusTKfJZhasmgvRhKBtM
 MxwWM1lWv4gou3U93AUZ7OobFjf6+7cR07ooPwHleS3VU+psA6ieK4F/CF4hQvUMD+VhHVjXf4L
 jPZS//cUm8CbrW7xJFmugbgOpQW/Wvrsx6Vq6OB6S1uI=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDE3OCBTYWx0ZWRfX60E/uKTOj839
 v5SiPFO7YtShwP0IAp4ctFOJkRIri5e/Wl4n1uVPkwvsZ3iCjNVoxaywOhASfx9gV8TwuBN39/V
 NwAA94oFQLk0oX5MWYZQD0KvVZH67p4xO8dNu36NT7mUMa5adlfAijICe+ZGzpWhs4YySEciZ7U
 mEdcS8CAnPIDwwXY96btjFINNfSOLVPKpjgY8BJcy5wNMaP2DwCPUvw35csT/lUr8Wgwi6hGqoW
 QSPlykjGfSVzrMdvfi71vMVkx6SJ+h9s+ZtD3g8wO6DhpR2TjMrug74ttiIUjVvgoSyKcsEnjho
 uR7VmfKVeNiT1hd+S7BDMDzz6QeYgZdXTlj7TWqSxJltJxQw7VgdTFT41D3ea7EvPZE9nYUzSMV
 5bHGp6gUdVQuzlTy2j4HeDRoeBwFFbl+LkN/f2DMDIJKcdyuIvEch6LLv2yAxcYDg7RJ6rqUIg4
 J9sJBzxrWY7iNJ77oKg==
X-Proofpoint-GUID: QFO8muxuxe5Z5ILIzeWfOnQnnnguoo4y
X-Proofpoint-ORIG-GUID: QFO8muxuxe5Z5ILIzeWfOnQnnnguoo4y
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=6990e655 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OgaCUeAxioZO__sieaIA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602140178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92856-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F7BD13D44D
X-Rspamd-Action: no action

When encoding QMI messages, the "source buffer" is a C-struct in the
host memory, so while the data that goes into the outgoing buffer should
be converted to little endian, the length should not be.

Commit 'fe099c387e06 ("soc: qcom: preserve CPU endianness for
QMI_DATA_LEN")' fixed this, but did it by copying a whole word from the
source into a local u32 and then operated on that.

If the length in the DATA_LEN refers to either a char or short array,
it's reasonable to expect that the struct is packed such that this word
will contain not only the length-byte (or length-short), but also the
beginning of the payload.

As the encoder loops around to encode the payload it runs into an
unreasonable value of "data_len_value" and bails, with the error message
"qmi_encode: Invalid data length".

Rather then complicating the logic with local variables of different
types we can instead pick the u8 or u16 "data_len_value" directly from
"buf_src". As "buf_src" refers to a typical C-structure in the client
drivers, we expect this field to be naturally aligned.

We can then return to the original expression of qmi_encode_basic_elem()
encoding directly from "src_buf" to "dst_buf", with the endianness
conversion, based on the size of the type.

Reported-by: David Heidelberg <david@ixit.cz>
Closes: https://lore.kernel.org/all/dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz/
Fixes: fe099c387e06 ("soc: qcom: preserve CPU endianness for QMI_DATA_LEN")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/qmi_encdec.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/qmi_encdec.c b/drivers/soc/qcom/qmi_encdec.c
index 28ce6f130b6ac355820bb295c8c96f9c6a6e385f..45bb26d010da77ab8d481897026b718c2290bad7 100644
--- a/drivers/soc/qcom/qmi_encdec.c
+++ b/drivers/soc/qcom/qmi_encdec.c
@@ -368,8 +368,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 	const void *buf_src;
 	int encode_tlv = 0;
 	int rc;
-	u8 val8;
-	u16 val16;
 
 	if (!ei_array)
 		return 0;
@@ -406,7 +404,6 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 			break;
 
 		case QMI_DATA_LEN:
-			memcpy(&data_len_value, buf_src, sizeof(u32));
 			data_len_sz = temp_ei->elem_size == sizeof(u8) ?
 					sizeof(u8) : sizeof(u16);
 			/* Check to avoid out of range buffer access */
@@ -416,19 +413,16 @@ static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
 				       __func__);
 				return -ETOOSMALL;
 			}
-			if (data_len_sz == sizeof(u8)) {
-				val8 = data_len_value;
-				rc = qmi_encode_basic_elem(buf_dst, &val8,
-							   1, data_len_sz);
-				if (rc < 0)
-					return rc;
-			} else {
-				val16 = data_len_value;
-				rc = qmi_encode_basic_elem(buf_dst, &val16,
-							   1, data_len_sz);
-				if (rc < 0)
-					return rc;
-			}
+
+			if (data_len_sz == sizeof(u8))
+				data_len_value = *(u8 *)buf_src;
+			else
+				data_len_value = *(u16 *)buf_src;
+
+			rc = qmi_encode_basic_elem(buf_dst, buf_src, 1, data_len_sz);
+			if (rc < 0)
+				return rc;
+
 			UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
 						encoded_bytes, tlv_len,
 						encode_tlv, rc);

-- 
2.51.0


