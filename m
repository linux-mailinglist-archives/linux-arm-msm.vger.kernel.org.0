Return-Path: <linux-arm-msm+bounces-99426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDd+Ab7BwWkHWQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:42:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AACBF2FE623
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EDDC3078109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0108E384243;
	Mon, 23 Mar 2026 22:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9ZXlE/k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ND4auYep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70916383C7F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774305556; cv=none; b=KKdor0BQUEHNmsozC0NIAnN1kTyzIgDHjGIu3NY76C3OXAsy7FjQmfA9F2DkOTCoSWuAfRjEZQxh+iXV2T7/nhyZihNg8TCRN6cPbBbnmN3+7/I7G0do0lZYDg/z8NPpaEQelKQy99Ii8ThKokz7JAsxL/Uc9z3XDPX2FoHJ7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774305556; c=relaxed/simple;
	bh=Fl/z/x1vRgiwJd1pRAYk5uDKCPsjPZHEyO/+LZ3AuNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxVmLxq+Ug88MQQYJkX5joJU3Dvgccj4wBVBkJLIrmX3eaivIADWahdFrKi4BFYunrZt+zpB8yVWoL70BfNITGCKf0g5sGbVziwx2vYpV0MJCORxzVdQc2RK98BaRFny4T/IsBQtqXSwQ8CcKrbe4c4xXiZ4JXeVwOo1e4bLPFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9ZXlE/k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ND4auYep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqllg3634583
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ngH86D4QhHS
	BBEnIjfBcEjvZR9eSdOdxegad2SenX0M=; b=l9ZXlE/ktkebioi4FzAUZ02ej34
	pgAeldTbg2NoSIWwvGTH5otD3KdRozbqoZYzulw6KTsX2GlWc/ef4DkOMW+gHqgk
	RLPZDEib9+8twMergcK/ESCfG3iOs2HIuPNCJDTKI9sug0Z1uEq3U0NUrXsM7sO/
	hVgxxVDMH1TVFt3FvRgttsvPgd+2JDRBplnezT7w+JaHOol3ALsb8zw/SVJxKRW3
	mqRHdkMO2JkJe6mw4GpaapCL6kYGUbriosAcuxf/0JazNNSO1GuX/ErbXcrbaTyz
	dIfeKZN7cdeiB1MVgrBC61tzagHCKvMQCyUc3Q7VjwAHs4LLtq+xpuq14zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4j9kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:39:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50937cf66b5so165694431cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774305553; x=1774910353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=ND4auYepQkmMZJbjA3zjL75Ogk0hcZyeqXmyyQ7oGABy4vEmfmF9K9lKkp0vFnFgLD
         gmc2l0ySavG7nNC2xtos4gTO2jbxeO9BWfLTxtfEYUbYdfoaGgn1mmlthDts4DaBg+0p
         z3HEYwVNqL1SShRzhbCjeZ201Mx1NVIFk+bY0MU/c/VIMdQRrBuTXU5IMhDXkA9eijPg
         FYqIm3pRLCATJeCmCAvy7vNt8QzgRCdMNa5GmJesn5F5bP1JOiTHvnXhpBeez7+qhdCb
         K9gKh7QG6xPbxUNX98kKpq4jLQnvDRqsSbEbT6iAK5slx7608XtvIDIGKXBZ+sCazg+P
         vstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774305553; x=1774910353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngH86D4QhHSBBEnIjfBcEjvZR9eSdOdxegad2SenX0M=;
        b=N6CjyoxZkposcUTZuqirI7WUnqj3RTYsgvKj9bsPlE3lZwJM9J0rFNHRN5m91Ew37b
         5QkpuXSKk9XD9A48ISV4ycQHEGOBGbh27nbxfWUba24PLf1JN/85EeIGWl0dknlml2/w
         SiDMzx0Z+nkq8jm/vt9I/dIZ91jF9rMDbC0Wl/RIkdORAFv6FihtgVuGY0s57UOtiVTb
         fQmHqc5M8vYYZkdChE8wF00j+QlsjbBEFJIC1HiRhbk8ibhr/YsvYCxr831nGW0imHUq
         /V9J3vzM+KemlvOT3ziUrcOrYMra6G+bhpl6QINzY/RXy460kU+LNUZDjZP6ZXXsN/AC
         2hmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7KcRAqmqPB+9tcndsvrKfpcQvoRkrt7uQ6OBXjSql/DmTAwkUu6E2rEXtXFWs+XcY5ItKtpJS0WILxMTH@vger.kernel.org
X-Gm-Message-State: AOJu0YzqutLEuL2skJArWQ82HHfsDvvR+Anfobh0GenEjbRrHZ2kmtLk
	Vvpn5Ko7XwONKAD0gs6EZoryeJThbtyDnTPTFDGgKwT8fXCxE74Iy5m9nqiAgyR9FnRKpUib+Yq
	fDmYUu01u31WvFTqfmxI9tOiWH51q4XvetSPYqmXmiLva6LXE8lhzJ+4cmB5zEZXPSewG
X-Gm-Gg: ATEYQzxFS+T29hrHkFz1+DUL6PYrvk+GVe+WYrSHRrUELzCgZZfmw8dpzkBfP6F8OgB
	AkNyvRpeKakxZOF5iyi+UBvm0XFfU2zrAHmcSZwFSwUFXMZSUPTcmL5GsaX2XSjEpit7AnBdJ/3
	XOABYZHo0Bekt3JZcDAFVOdk1NM5eJX/EPcrq8fucnKz17rlws3ezpEz2S4ZiY/Q1W8mH7jd/+n
	vslJYuMU8Fj2S51HFbWp90i7hsc87+RqL8vVWy+QQrT6l+3ulMO3tj2iG5Wf5esIPmcGAB901Ir
	usQe3YazAE/LFKcxsEN2GYa8EMhuJ3QuQbHoj2a5JtXh9862knSXG0aP2OutsqhyB5L7Q8rtn9G
	BMd0KhSuHiLwDeFf4OaYTcwrzIQxXzJuvutTQw+bW2F78BvnXTIvqkJk=
X-Received: by 2002:a05:622a:1f08:b0:50b:496c:baba with SMTP id d75a77b69052e-50b496cc8c4mr150377471cf.57.1774305552898;
        Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f08:b0:50b:496c:baba with SMTP id d75a77b69052e-50b496cc8c4mr150377131cf.57.1774305552516;
        Mon, 23 Mar 2026 15:39:12 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64715539sm33320351f8f.33.2026.03.23.15.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:39:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v7 10/13] ASoC: qcom: qdapm-lpass-dai: correct the error message
Date: Mon, 23 Mar 2026 22:38:42 +0000
Message-ID: <20260323223845.2126142-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XuVJdoLjJ-jqcKHhhgj3VKcJeOSUleKh
X-Proofpoint-ORIG-GUID: XuVJdoLjJ-jqcKHhhgj3VKcJeOSUleKh
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1c111 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QkacBUY9L2qTTJrEq-kA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2NyBTYWx0ZWRfX2RMdnjgT6yh/
 IV/KU7M7sUknbNWzVIKuaJKhUQ2WvYf4NoL/aPjpzqtuWlEFsJU33upa4oVQB/gqwUvNea6Wnqd
 v1a90FupvBBsZAusq2WDlOVRoigzAlZbT2N1UNaohvMKsxBX3Lqnv9fnPxOz6l91fpsli6AhPYA
 W2rZXU/TE+m00GJOYEsR4hiWw8MAykXrwq3ihW4zaub3xbkgzkzI6+e3TaDQ16TRzLZKlw7OG1U
 aW1Ve6q1Q+bzxX1kpqVWIpgQ8SE1vjhVOp1AMaJdgSX+iHknBeQNyQtOvmfKWtnSgIdxuoRKfr4
 fMW0c2psmoCeI7vY9eu/xk2qdmFBWohaFpkCum0qyt0Y/PKjGzZB1nfXTh8gIZ75Cgw4XBTo6Cn
 qjWSj/NQO46wcq+yHJ1MlfmRMotl6hOb6M2MuLV/FPHUxGES06CsfkS7L007PlIron8FsSwoo6Y
 PqyB0VXXGuexWgDPOzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230167
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99426-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AACBF2FE623
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix the error message to reflect the actual graph stop error
instead of graph close error.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index ba64117b8cfe..87f6db12003e 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
 		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
 		dai_data->is_port_started[dai->id] = false;
 		if (rc < 0)
-			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
+			dev_err(dai->dev, "failed to stop APM port (%d)\n", rc);
 	}
 
 	if (dai_data->graph[dai->id]) {
-- 
2.47.3


