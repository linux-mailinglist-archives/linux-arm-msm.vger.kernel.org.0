Return-Path: <linux-arm-msm+bounces-92887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIaaM17Ckmk4xQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:08:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 934BF14132F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0497930117A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 07:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565972797AC;
	Mon, 16 Feb 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeqAAiP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JEefAqDG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA14227EA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 07:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771225683; cv=none; b=A2hnuRz5EjPRUD0SZMHrrflFbDU7tD26Z9FU++kZVUNGUAb4nJZ2ZSRn+AwdtFld0jRPXH+HwSSHvj0FQmNRcwYl3icYEScHI42m6DkRguTiZRuPL3CY4jImrE3eORtdaY9DTO9SPHv0LnNjg4SegLEsDc98PN/V+HXIcpkf30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771225683; c=relaxed/simple;
	bh=LoHMRhwpy4wi9q82FqzTo9evwLCImd3dyKPb99tN/Yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BOWqn/ETWLLS2EUVp1nkAo1vJhIWg4Ev9xqlgUnhn/LxiVyajCHV9VjoM+UhpIyt8Md+puat3nKXYpcdq0Nr5IAL7HuLmvnv/19TZynGjrZkLuvmGfzs79opUbjVsabih43cHTWDM/Ear7wR76xMn3Yz+B2y4QkQTUYdA6y/g3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeqAAiP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEefAqDG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G24cGY2522870
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 07:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HHYaXoVjbeIMUr+E51fIUr
	kafe5pyMGEDShsm8l6+9o=; b=IeqAAiP95dMP/Z/I7Oeq51rROqtk0QIwS2RvtW
	gb7xdErtxXn2rzTs2wbgEtKqfZDp7LBRiyHKjMPAC/2+f59t3oFtaa5cW0p9Mi39
	TfNybB/wOYlESlphimwqAsdnDX86LQf3XFDs9U6o1EZnJF8jON+LHeyixWr+oQ27
	5raWCEA8UucTAbmABwaYBSuDzcPwGpKMaiJ8cB2Vg7J6LrzAgEIun+DSbvwufXde
	8DqqOnT3niDBY5y1nALpIztuwXHJdXzFhC5+E81xQOcMUMlpmKodFFJpesWuPwAZ
	vWbboive8O/98k405nVBzLUj41VslOLoPoZ6Vei3nRMdwcSg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6buhys5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 07:08:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3562bdba6f7so13786725a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 23:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771225679; x=1771830479; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHYaXoVjbeIMUr+E51fIUrkafe5pyMGEDShsm8l6+9o=;
        b=JEefAqDG/xK0i+FFVHBMeNjOd3dIoJ7NYDPZ5zgyY1LyNtndICEppGO2SUGvZetLq/
         0KZb+NRfatRnjM3lZ56dM45E8SNhbyHubVlJR+2tIyYLverH1X1e5R6e6UgqMcJAVtkv
         4f5tNrP2HdC+OQzn3j03iWGsa/CMY2J8EUUWbxIt9NrA9OCCV/xFOuKspZq673MTzh21
         3Ii2OwpJ+A1GC4jTum69PbYTJn0YvMMVWZq7XAEPE+PR6EevN9/tO72Rxu23qobVTpAs
         5fyjEyqhO6b60BuyUUJmAd3uzecJrdoZvINFxxUbTsfxlyQ0VwP2EIwcrCX1G+Jiplyq
         Vqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771225679; x=1771830479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHYaXoVjbeIMUr+E51fIUrkafe5pyMGEDShsm8l6+9o=;
        b=UtCrOP/26Jrym5h0LAQQIMAwfznaIjS0XPktW5gFF7XXQ7G2CDvZRf+DyvguAnOnw2
         8BAGo4fKuZNbVOvn935YwNezTPf3fPAIM6xsyXv7POsGQYad/L7BF8FUGaB0hkjZFGoE
         qdRmItyVxAIntkQDTvtaEIpj1Q06wqVEWulAoW6gR5yHaOCYADl/k8D1yIhGr8w9DXiF
         TdQxyKLkiBQfyoWcvwdI8A6ZDHhpxST+0CjlhEF0Xnf/vJWum5kk+hwQeO+FCshAmZ/C
         gIj/Iqpevvs3hDwsr66/BuA5nqlPzTW9HZkBYegEAbT72gKJH62BTGVXavD3X1jJOVEa
         K0/A==
X-Forwarded-Encrypted: i=1; AJvYcCWtIluA2HnuDGzQFNA77cccW8sv5YpHAIY2EC+yYBBluoduoznMUeAXWIng62Bpqx687ZOFW7GoF17Kjf/e@vger.kernel.org
X-Gm-Message-State: AOJu0YzpqplrpUs69ai2EF9Rm7GFAhKV0K6iOnGublZoe5OcSOPvw+TC
	yDTBYt0dFsCnhiFHtfjyxouzgeJJMkLJlR8utbXtH2XcZnXAoCqqBWjdL91Ar3ZjbuPiXsX2ng3
	7BVeNmH8iUF+2boPvOlICqEHsg5R9KRBUpYq3QZkavGhvqjArbf2hfcScbuJ/1uAGl0G1
X-Gm-Gg: AZuq6aJcV6uZ8OdBsXajA9FurTSzhjhDDTNrwBoMggVN6K77TQn2Pm6xZAAUqpRMIcH
	0elbb9RvBJ3r/UmBQZp4njn2ZB1Ph9RF/VeI4DeHguz3jEw4+W7QXRj8gkK+bFzJNAnNwbm+Lb0
	vmCaqHlRkiekzZmJ/8QgMwy2YAZsxLI1oCrhmRVseirL6ZzhYy974R8+9YQwH4GFlJpg+aA0PS9
	jD01bSISw7JAYqhac+xpn3ydoPTtftWlsBSuAjz2CD0usbHYWXA6JIsdTu5aamFyCqGM4IZR8/c
	H+/G5xTUhk9seNYwTOuR0Zhr8C4Ye+C2UWTpPFt3l+F2VRnnIyxaBbz+NsSvuGgzkU3UdlVnVMB
	5Q9TyNJJjTAyqIRrniXRPg1CHcHOgWD59tqXVsWf1Pb7nk49Mc1RkmxIahBI=
X-Received: by 2002:a17:90b:524b:b0:354:a065:ec3b with SMTP id 98e67ed59e1d1-356a7a88d7fmr9485769a91.27.1771225679363;
        Sun, 15 Feb 2026 23:07:59 -0800 (PST)
X-Received: by 2002:a17:90b:524b:b0:354:a065:ec3b with SMTP id 98e67ed59e1d1-356a7a88d7fmr9485753a91.27.1771225678882;
        Sun, 15 Feb 2026 23:07:58 -0800 (PST)
Received: from hu-dikshita-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm15634650a91.9.2026.02.15.23.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 23:07:58 -0800 (PST)
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:37:42 +0530
Subject: [PATCH] media: iris: Fix use-after-free in
 iris_release_internal_buffers()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-iris-smatch-fix-v1-1-51f6b41c43ab@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD3CkmkC/x2MSQqAMAwAvyI5G6gVivUr4qHU1ObgQiMiSP9u8
 DgDMy8IFSaBsXmh0M3Cx67QtQ3EHPaVkBdlsMY6Y7seubCgbOGKGRM/6IbkgjfJR0+g1VlI9X+
 c5lo/eYrwd2EAAAA=
X-Change-ID: 20260213-iris-smatch-fix-68f6a90f9c9e
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771225674; l=1867;
 i=dikshita.agarwal@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=LoHMRhwpy4wi9q82FqzTo9evwLCImd3dyKPb99tN/Yg=;
 b=3FOsbON/Coq283e9aOPoX9tQlaJadDzMczfE8St8JI92y3ZuAzdj6Hx0WXGQvolOSw8gZOf8w
 ov9JUvmYPRcCD/om+8BBCZfI6Nd7ZQuU7Ov4nOgSFAatKtxytDFo2Qt
X-Developer-Key: i=dikshita.agarwal@oss.qualcomm.com; a=ed25519;
 pk=EEvKY6Ar1OI5SWf44FJ1Ebo1KuQEVbbf5UNPO+UHVhM=
X-Proofpoint-GUID: vETqmt2RUgzRnoeYwZMl2NneDPODmXAO
X-Proofpoint-ORIG-GUID: vETqmt2RUgzRnoeYwZMl2NneDPODmXAO
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992c250 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=EUspDBNiAAAA:8 a=xD9hxEe0D-iu6yI6bpYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA1OCBTYWx0ZWRfX0zdbGeD4nsAA
 8Txp2gw3HWswW23qNmyErAzrjgP55OlnMo3NSplm5O3thf4BvRzjXTlWJQ0DUlfHs+Kcq223D95
 xf4qUWsTkdOAjtYKEtUH3D0Coz/O7pZPtzW6P6ttzqITbvJSmqIzk8XRp9rop48nrZ6aZ626q7J
 Vm47h8HzoRxORgpRtOL/5/tDf+ce4UkDVqRlEedawoAy9SKyZVsZsFa310SgW/GwxSrh0fqEqxu
 /JWF3q9G6xn5MPBzgPCfdZR9PgGSySVAgAUV/YBNMJF3pCJ2C11jnlNBatu9osbLMjW3wZ4TJoV
 ooZtTVLduMb1LPKrtVyWtDIUtIvn33LtW/nnnZJgM0sGod9/oJho90D9ly/eLkaKQfvlTmlrZ/u
 buk7XXGtAm5ilnpo7ugwRpjOWMmvgytDC5SaKhQngXQDCjVBvfnEk+vFOtBuCja8gIWeDYfftgV
 bcgqsO60yedushBe+8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-92887-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 934BF14132F
X-Rspamd-Action: no action

The recent change in commit 1dabf00ee206 ("media: iris: gen1: Destroy
internal buffers after FW releases") introduced a regression where
session_release_buf() may free the buffer. The caller,
iris_release_internal_buffers(), continued to access `buffer` after the
call, leading to a potential use-after-free.

Fix this by setting BUF_ATTR_PENDING_RELEASE before calling
session_release_buf(), and reverting the flag if the call fails. This
ensures no dereference occurs after potential freeing.

Fixes: 1dabf00ee206 ("media: iris: gen1: Destroy internal buffers after FW releases")
Cc: stable@vger.kernel.org
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Closes: https://lore.kernel.org/lkml/aYXvKAX3Pg3sL37P@stanley.mountain/#r
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index f1f003a787bf22db6f048c9e682ba8ed2f39bc21..fd30ec8e33653bd21d3c4d1057f4f1eea938228d 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -582,10 +582,12 @@ static int iris_release_internal_buffers(struct iris_inst *inst,
 			continue;
 		if (!(buffer->attr & BUF_ATTR_QUEUED))
 			continue;
+		buffer->attr |= BUF_ATTR_PENDING_RELEASE;
 		ret = hfi_ops->session_release_buf(inst, buffer);
-		if (ret)
+		if (ret) {
+			buffer->attr &= ~BUF_ATTR_PENDING_RELEASE;
 			return ret;
-		buffer->attr |= BUF_ATTR_PENDING_RELEASE;
+		}
 	}
 
 	return 0;

---
base-commit: 205697a4aaf20ee56705d7b4771f4081f594e7f7
change-id: 20260213-iris-smatch-fix-68f6a90f9c9e

Best regards,
-- 
Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>


