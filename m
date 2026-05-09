Return-Path: <linux-arm-msm+bounces-106764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KasE+uW/ml5tAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 04:07:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC44FD880
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 04:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31DD8301E7FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 02:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BA129B799;
	Sat,  9 May 2026 02:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFOKjPdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hQmKl9V7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A584276041
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2026 02:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292456; cv=none; b=GQjtiXM+KaCF8MHzvs0j5eIZy+hOcsTIsFZDtDd3gjImLccSl4A1fT8ByJR6tcxasG32V8pH0KoiTNKBAvDKbFQH0ef+L76DLrB5bMqLooODR4tVf6is0RRTwXCjftT2zttKa5yDLGUUq/9vDONNeZb9z8KSnliE2D/GqvNL1Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292456; c=relaxed/simple;
	bh=vgoYs9FgAhNvftMNEGkFZ6djxM7Y6gvQAHBMehPn9xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QokKr61ZKq/BqzVTpeIC9b3alv0xrLpCtox8K7GWXGD8gAzrmUb6QBkSk4pTxN9hTlO8H6BXGtUBvqiezwkHk/yKBSxReyzIwBr+AVLOVHRdr8GSiEYOSgbu6YYEKBLpB4kcznfLNI9X7iPKYZavlZJdSAOLHpyRDaRzho6hX/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFOKjPdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hQmKl9V7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648Hed0g1661915
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 May 2026 02:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tsgJNeDYkNZrYgCDAEeXbbQuL9/T2evJy23yZXRYcM=; b=gFOKjPdmajjyCkjW
	7XwMBvhwzDTvWJNRv1qbmJXf/rjJDiXWV4VGxuiFtPLUkYdc38DXUcqcMl586K74
	aZITjCs5RdpWlDaX8EBOCEddqLoBSmceoEmaTXDvLlrafKmuxBe6Fca8yfwyr7vB
	01OKQksRnXk3ahgasrraK17qFhKpbAmGIF8S4g30ZPqpuILZwNqv3GHfFQUbVJeI
	OrBXV69uTTyxz2ynnz0z31C/iblLZ8SdJO38d6L92g3mVdysUd3CgsTAYf4MHclK
	DJqHVZfwkVw0zfXf+i/i+AdVoGCifWybaXMreqAdJAyLrj1apDIZcwTAAiYwJ4zQ
	JHrx3A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1men18mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 02:07:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f525565b33so3448812eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 19:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778292453; x=1778897253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+tsgJNeDYkNZrYgCDAEeXbbQuL9/T2evJy23yZXRYcM=;
        b=hQmKl9V7IDShnkKMbP1cMBtbyjio93RR//dK+g+nfYvhzwqGqVVhska7krt1BuzBBb
         zNbaFU/YDY19mAOCTGYH+ct+MbJIi+mIkhWSxxFQpZFUgWyzMqZKMc3VxsjjlxgGLYvk
         ioYxy7Rb5sMXbrfFz9DUNDPwCqigGHt/LOPSRlQg1te7Ts0CgJh+dtgpfEIfIpqYftmE
         G9MiNlNuiNC+tGtJKztObmyZM4C6Fcjq+jO6BYXWJ9PKZxuTXhV5hDYwqBM+gmZPYlix
         ztsgi4AUKpPEE6ksjl3Q3aKtEp6Nl/mepTd6W4dGzK1MXf0R/FylOY5Cm4I7OVcDPpEm
         mW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778292453; x=1778897253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tsgJNeDYkNZrYgCDAEeXbbQuL9/T2evJy23yZXRYcM=;
        b=mMjUd7Nk8p7z3MB7zPhYpvgCLsp9oV3LJVlacpu5YF+k4eb19HDu4wGHihmn4PWbxx
         CLJGBFkzf2BkJO+MzEgifBd1jxeqQ3+rYI5sMOQMvQUTyJAfhV7f/eZYYRSk+pDzh1yx
         9Eck2snMTV0qMviZlpEYp5HbBL9adDtVB/MH1kPdYx9Gkp1hGppfulTYMDZEJu30OFxT
         PAqRAD2mc5+o/6kiD5iAAQgvVkbvIRF91tVhlVa7YJJbWstkWrocfEE7itblIqsyQyLc
         VW0MA+vmdVzb+z3usnjprs2PuqtmivjU8heGk4qLfBX4DQhzaD+UOb0lH3rcBBFaQMP5
         9mAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9kzkehYIoOQkG8YhcxeHbFP1wwch+5CYHVYDQ4Otd6GAOmo9psZQ8uMeYd3GgWPlLduimRaOxgSpHNwY5F@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+NgiP9P7ZlYUGYZ17247o2jII4PWtlR3pOoF6+yFkiyXkO/r
	3mDwMAYJcKaOeiySYdcy/lZ1eVxJjxDaiZ1u0ZM9wnd5YoKRCZIo9KepmQ5sWdr6hYcCqORQYyV
	o6U1MXSzOrbgvVqBb/fclmVW+c3jfiAeUK2yUI/PExDJzH8CB8pE8Plw/+HaiNkJKdtmn
X-Gm-Gg: Acq92OHckMbVPf2T9XO3PAQZnclPP2wVOECYrYDOuE7yX9e4vVn/UUBcgUeWYcjemgR
	Df6f7iNJIT9TJtB+s+cQTLstvpgEay/GTW9Fy9nIag50LeOyJMuQeVN99qdyUYufoSNFUFnL96T
	CcaKy6LjXHkX0VT5b06KDywi+usU1pbaea4jQjR3C3kJQWWLqAhAfbUUA5mUZXXnv4EhqwpeT+p
	UDZ//FwXgPI9GNu/QArlUOpHI2rRNEVWNFMELNw8dNM2p85USdjN/Rqitee4jJBnmy7oy2JdeRP
	Sy5cadIdlW/g0Oc+rwEdkgl+SuO9ZJzCylEGo3t8bIg3WSZH+7BFpIHuEV4DdvVVA0dZF3A1t3z
	Z9URuaRVoxeTCet/hpAvf7IOhvKkBW8apbvuA3YZ9UpP9W2CvDygZ/g==
X-Received: by 2002:a05:7300:cc0e:b0:2f5:285c:4374 with SMTP id 5a478bee46e88-2f55114357bmr7224672eec.35.1778292453016;
        Fri, 08 May 2026 19:07:33 -0700 (PDT)
X-Received: by 2002:a05:7300:cc0e:b0:2f5:285c:4374 with SMTP id 5a478bee46e88-2f55114357bmr7224652eec.35.1778292452295;
        Fri, 08 May 2026 19:07:32 -0700 (PDT)
Received: from [192.168.1.6] ([49.204.109.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb034sm4717498eec.5.2026.05.08.19.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 19:07:31 -0700 (PDT)
Message-ID: <4d90b061-95ab-40d4-83d2-13425e992d4d@oss.qualcomm.com>
Date: Sat, 9 May 2026 07:37:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
        AniketRandiveaniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
 <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
 <afxJmZ9MkP5eJkQC@sirena.co.uk>
 <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
 <af3spostNgoRU0Vv@sirena.co.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <af3spostNgoRU0Vv@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAyMCBTYWx0ZWRfX16YnLGewm7nh
 VEPOJrSzP+BV8j83ahNQkCby+xmRht07/fmqG/s1GvnpjynNeOoKGBrb+Otnbn9Mcu6GJoQHXYT
 h7juk47Cb5edZtOKaqpCLo7LboTFiZV9/lWetZwefNL26+bwj5uaWMR3MgA1T9IqCipWYRrYS+b
 cz+ynfDMvz5XXXZ/NbPJa5JIfamUecPwdqFEk3lsBdAGy7jF60H5ZJI139q5A7Wp0HT8Ze1MBML
 5KEskMq+FCOkk20D0NnByxRJO/RJPQEQgiTbX3kHUbEijdrVUzUlz+PtmELJ2EycBXzDdSPRlQN
 Vy8iOmSBaTfFFWIm6Z5LpNDvHC7jLpSMVZyPz2IBPyz6zu4tiUR1jTbjgk6pB9DSPOOpbIZkwG/
 q5BV8pv0gv7t6iPeAisvYAQ6Q0jfQB2JMPvm/n3Sg4/dhOUFFoIIQ1bGTmNkKcpyXMp6B+GwiqD
 65iwZbp9U9GRV/3HMUw==
X-Authority-Analysis: v=2.4 cv=LORWhpW9 c=1 sm=1 tr=0 ts=69fe96e6 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=TOgzk8GLwxQW6KRttr6vHg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HwLHRb6XIJqLuLjHUzsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 4yGgCsac-7jGCRYUkkSB2iuC4-pEkf9A
X-Proofpoint-GUID: 4yGgCsac-7jGCRYUkkSB2iuC4-pEkf9A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090020
X-Rspamd-Queue-Id: ADDC44FD880
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106764-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 08-05-2026 19:31, Mark Brown wrote:
> On Thu, May 07, 2026 at 11:03:39PM +0530, Praveen Talari wrote:
>> On 07-05-2026 13:43, Mark Brown wrote:
>>> By generic I mean this should not be driver specific at all.
>> I hope these changes are fine. Please let me know if you have any concerns
>> or feedback.
> The data tracepoints look plausible but I would expect them to be
> generated by the core, they'll be there for everything so I'd expect

Thank you for the clarification. I now understand your point clearly.

Could you also please review the changes made in spi.c ?
I would appreciate any feedback or suggestions you may have.


diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 91dd831d2d3b..f0d3665412fe 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1658,6 +1658,11 @@ static int spi_transfer_one_message(struct 
spi_controller *ctlr,

                 trace_spi_transfer_stop(msg, xfer);

+               if (spi_valid_txbuf(msg, xfer))
+                       trace_spi_tx_data(msg->spi, xfer->tx_buf, 
xfer->len);
+               if (spi_valid_rxbuf(msg, xfer))
+                       trace_spi_rx_data(msg->spi, xfer->rx_buf, 
xfer->len);
+
                 if (msg->status != -EINPROGRESS)

                         goto out;


Thanks,

Praveen Talari

> them to work for everything.

