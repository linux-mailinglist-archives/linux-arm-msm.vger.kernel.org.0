Return-Path: <linux-arm-msm+bounces-114440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6YrcD8OvPGrlqQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 06:34:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 878EC6C2AB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 06:34:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EWmExZUF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PWSH4snW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114440-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114440-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE3AE302A05C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4361F2B88;
	Thu, 25 Jun 2026 04:33:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB5E17993
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:33:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782362024; cv=none; b=TsxvqCdZxiWmE3hZ+r84cTnCSliit72zz3yiAzQqikpKGGKH5VvZ99n3AH8FwqYOcgEeJ2UhzqTfOPyQtOAluNwr+XXiC0yW6PPS3XF3R03qTfqeWIzVsz6iuxrNWi1ldDzOFG7YK9oedQk7YLFloEd74ABmv5BXfkJdS321zL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782362024; c=relaxed/simple;
	bh=di87V4TuWc8GxaW2bpmtLqkg86RNsVY13ZKDNnUAke8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwpxhINYyllO/Udl/sseq0mc32LuwJL5MULW0biR4qbVbVOdrcrHgdnd/164vxTH1udNgAvvFXuP7G5ED+t2LVz7J+3PvTMNl0Nkf5lq5PMd1dXJvL6JxlnrEfRBt0Ax1qJ0oysS1H6/zTgcJF/x+E5VhObV3VVcrE2NBXxDEMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWmExZUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PWSH4snW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eN802261886
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+FT5jSvovKl8mmSq0cLr6FQpeeAxgbMVrgag/p1Y74=; b=EWmExZUF1I3+nn1z
	iwUXTnwl0sTFyMMiydaHqbC2SdsIEEj/T8YdA0Z2lp9x3g3z+5Ui/Yf29u7CFRd5
	ZS5eTePRAFHD4tWDh21LqlNr5oZ9XT+WpRLtFVXeGX+Xd/lAN4oQjCt6SH7RNL58
	HVWk6A6aVw8rtbBP4920wvJJ/OvKNmEvg8tqX7PwzWtJpH4utoGKh4liwjunQD6W
	J1bJamDStUNdGsziDCsoXAdLkCoa5aVVxUPCrj4l4CHPzQflZ37lDDyr5EzbErq0
	bFebqKrzn9MWtRi6HN6cfCv4Qli7LfXjyTV3+WLyuM5Cb6VFHglxqixqV6Q2VFnY
	nv2AHQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0aqpckye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:33:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c011c7cb9so5194249eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782362018; x=1782966818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+FT5jSvovKl8mmSq0cLr6FQpeeAxgbMVrgag/p1Y74=;
        b=PWSH4snWfILMzzVwiN+0Bwajlw7779aLYskcLfRHl0JNnfB4QW6AgHRo7WRIFqSlSN
         IscHnOQCASaLJAQTe2BkElc8W6J5PXQpUM7hjL9/tHd7KsxqhWTc+J+F71JQtQP3m332
         7asklkRRdj16d/bN+gxfDUeXm0VmuHYS5Yip+ECcHFFmcf33NvizxnRSer7rMZPPyCLy
         oLFja2eyrfEVfDhaJOKPZwzXVL/SPXhpSswEAuNbNL50X4Ds4itnoQAG+NTBXT9OEEYG
         zFrXYidpzqwPxy6KAHqoRg5kJ9wyujVWcM/VIXlENW+KHgW6LMkY4f6MXz6Tp9zYJwET
         QawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782362018; x=1782966818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+FT5jSvovKl8mmSq0cLr6FQpeeAxgbMVrgag/p1Y74=;
        b=eNUS2WUI1ExUo1LtIDhyQbk8xZ/J4kv7XYrwSiAJmsg9Yp4NZ8+8mwTK5t1kyK17JN
         WmTZWLt1uiZPegKpYYjLbX3RdsP9AzCKPA2VrKv9tkXZgmnhwvFnuxklS58P0/+ndUmP
         +Eo9DP/p/rVPRPCbFi6my6QJnz6qUhtQBr5m2UfVY1BY5B/Rs/DZj9GtzY2dh4anpkcA
         CzPuxy2WO3KHHaVGEH9iS2tpTgJ8J5N/JkRbhhYoHRmeNXiK9SmBVA6/fAhqbH40ZgjK
         /xTNHzqgnDFVVTjyYfs59b6xsFuKjxID5AAxZTawlisB8rvYVaYOltFae728eRWc6a6P
         7Lfg==
X-Gm-Message-State: AOJu0Yx+TEmmA3RHFX2yUEDf3ondlPFPQp3Xes+ek82AotjHqoLyoIGn
	GsrCZGTKUzeVvVVvBp0vsVq4j9iIJTuhpXz1xdzn20pQSMMw/liQRIJa2tvejb9IJLFZgQz3vBN
	Hut95K/uRxFyzxokOWLcdZlgsFa65QpirMnxHa31F0Hr0NF3pLSW+dAYzQJ3YFKyWx0jb
X-Gm-Gg: AfdE7clGeraStrEAHXC6Odvwk75S1thfz2CDFUqdmW8pfX6fGYnBIycD8YmXu1qXBq1
	5X26e//2B3eKrhkN3A12DXb2Qd+18AkvguEySRSVigB0NCdw9FrryvWlvflgsvSkbkMURl3FC5/
	frWflYh3DalrdAcmq9XLvQ8LQ+3XWlz2OFGz6WnUbpcMm/j67EnSnOzXubzCo2aTkkNCpUHDTiD
	lQiFc5p4Q+0VWhtQHj/SWZci/i0BgatS2WkgG+7+RBK1JBMBick3s4jXd7dIVtDqwRxSlj3Wk8J
	8AG0IOHGAAjhq3ljCEgvLt8WZ4hWhbt7avDq0iQ5oC50viW8D1Wz8+AlXhBVQ/wduP4Ezb/Xro/
	/+8L6nUKiB2opj40o9KJboMR3/HeyIbpWU/ldg/8=
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr1135171eec.11.1782362018186;
        Wed, 24 Jun 2026 21:33:38 -0700 (PDT)
X-Received: by 2002:a05:7300:7308:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c84e2074cmr1135135eec.11.1782362017677;
        Wed, 24 Jun 2026 21:33:37 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c664sm4251756eec.8.2026.06.24.21.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 21:33:37 -0700 (PDT)
Message-ID: <37f34aff-c68f-43ca-b23c-500cc9bb119e@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:03:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: qcom: Unconditionally mark gpio as wakeup
 enable
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260616-enable_wakeup_capable_gpios-v3-1-fb59647d89cb@oss.qualcomm.com>
 <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <d9e778ea-8a67-4576-9c96-9cfd859a266a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mD7-u8K17unc6hBiBKkqtjT89Moqj0vy
X-Proofpoint-GUID: mD7-u8K17unc6hBiBKkqtjT89Moqj0vy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDAzNyBTYWx0ZWRfX3uxVemw909SU
 nKOzfnJJ1A3Jw8rxQmGSlDkw8AQMpYSDmJC+XynUTb49Xaq/PSY2JF/AN2TimuDahBV6rrY2RVF
 BHRCUsvpaD/a98mFw4QkP93fenp1ZiQCRSJtTQHo227W+e0YB4tLfH8OFYq0LXMm+Ui6VHcpxSN
 0+mHhaao5Zl/ILeQrCGQPDDKMCkl6oElilgnN98VxjAjJ+rlrHnbhjXCwdgWsR/fdKLIigBSL8V
 odXv/Pc3Hrg1dOaUg3yCiTCmOH56QaoyYwvCB70kMuDW31lrZ2rLnXViFGnygHbwPc2ANzCd5cB
 9VGadEkMPZM+BJAoic3K7Tk1SyQ+YQcJrJOzEMkPxR1HDAesgpFIOcoBHFVQAfnnzUnW2CfK1u5
 GJhaWExRYDvp73Wc5bfKMZdb3Ll5ZA0KCqvaDMUieNsAMehW6bUScpRspIQ50Nuw/J7SBvvsxew
 wqhZkRGLbbcQ5pBoq3Q==
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=6a3cafa2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=K6J0lT_fCWCxxGhrr3QA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDAzNyBTYWx0ZWRfXxX3wwdeZAuTn
 lDN2wNvXbfsTuys5M2+VIWUHAmXuz3lQ5Rfu8qymx6NyqPQXttibokvy+EfpD8YYzKrP9jfGhTf
 wtd3E0NI1/u4q9QGv8C71i0rWqw9fd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114440-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:linusw@kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:maulik.shah@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 878EC6C2AB9



[...]
> 
> This is a much better commit message, thank you!
> 
> One question remains - should we set skip_wake_irqs for MPM too?
> 
> My understanding is that no, since the MPM HW is simpler and doesn't
> have a register for acking IRQs, so we need to do it from the recipient
> (TLMM). Is that right?
> 
Yes that is correct. skip_wake_irqs is set for PDC since PDC can handle interrupts
during active time and SoC sleep time both, so any wakeup capable interrupt source can
be handled via PDC at all times. However MPM can only handle interrupts when
SoC is in low power mode, it does not have the functionality to detect them when SoC
is active. skip_wake_irqs differentiates this behaviour.

Thanks,
Sneh


