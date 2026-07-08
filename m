Return-Path: <linux-arm-msm+bounces-117785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZUEAD9SNTmpHPQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:50:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E8572953D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 19:50:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mCMPP877;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gusWzy/r";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117785-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117785-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 849C4300F5DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 17:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285203ACF0B;
	Wed,  8 Jul 2026 17:49:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF362690EC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 17:49:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783532985; cv=none; b=g3zYYCyQh6FEDDEsz5IMXzl6uDusiMYiI97oFYyVI0PhqvLRdO0X57dhhxyTBmrjUDNIPgalEUy5NNHTDcUFpXnVLdOHg8K9+1o00F+P767pED4MRcRDipVaDRTvrkx2xFVhvNPzO6bQy5SFdGIYoIn5ajpppZ13W7PyWP1cfzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783532985; c=relaxed/simple;
	bh=LvxCHrdM6ZOJ/J3A7orQz/W8gmnF4rhcghvrTkQNOts=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wo1MwjJYDoCRMN8hn2cBIfLuW6KdlYWIQJWFtAzQnfwkdae08/L6CPuALtUUGJAeo7SL1e3HWbGhW+3IDJWgeh34Yl97c7/RPHyVL3lHRQe2DNV5QVu1u8yxjCguQOYYhU57lLrfO/9SxiA99xpvCjCGf4E7MbXwOmuv6HJ0/3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCMPP877; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gusWzy/r; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GL2T33256450
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 17:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RZBHsUYn+gNl91h+2+3Z/xDo4fDHSJPAjCPO8O7F80=; b=mCMPP877x0Bol91s
	Jmsy1krXdXHP7nY8Jv+E0deztqPdfrX1okfouEc0C2nZBoCOGMh+z3oPcgXzzhvD
	/wPeTR/KU1m6AKZN1HTPDNfZx1f8KDLAQjlFIi/PmJQBoEAN0Z53BPeJnRZJ2pdt
	MkWvxNUNjoIjDp6d4dJOAEDytmcfgtkwei7BLxfaFghtSq3AmOClVnpWLG7qThkL
	0cy8ZXXPky1NEsG++gDZhJ7p3PKHkTGpjxBm83P41w+O5sjVEXnKfHYLD/5VVrGj
	fLWLsh8+95S0kkvSzbP3aMWF+vMjtn9UpHTvfPglA/A03wcikzfKwX0nVJcBKY4M
	qmczXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw8fat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 17:49:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so19505521cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783532982; x=1784137782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RZBHsUYn+gNl91h+2+3Z/xDo4fDHSJPAjCPO8O7F80=;
        b=gusWzy/rJ8lJ7jXr9qWTXHOTLBE/8n0643mRrRMJMUFQlMfI0Eg2+lugOT544pRy42
         0YtWYL8/VzZxrxJh7/YRa5WTy/LhpzeDz4r/XfHTHLpLPBdvwpClGrrm8fVAdXPq3XpO
         m6Al3rXp+pukBQ+AXQBlA8WQZycHXL/dWGwMRP3iaBLNLAfzv5DndgE4QEUqC0d5YzeJ
         P/pwDrNum/2mDAHNrvhFClTjmSDhQTAjC7KSJ0/GtJrvIFSMFN8Lr0XC4/5kcIiXfKSH
         o6Am/ujEsV9h8Lvdmz4YwANonfWaiTAwVDIxa1AorY6SmrTsMfllADfGvDs0sM+4VTL0
         DJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783532982; x=1784137782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RZBHsUYn+gNl91h+2+3Z/xDo4fDHSJPAjCPO8O7F80=;
        b=WKuCLGYwH9Xl6oLRbAs0a2N+Wbu8OfkulftBmDMi46t3RRu0KkqJxf/gsOMSwoAwWz
         EkSQRy2sN7gtRC2FML/s0Cek9huvtCkWP5sQlRMpH4OpRKroH12p0reMrRpjSo8/deER
         EsejHJgFYwh9floKLGwF5BNSI4Dq1eld7NJR0lT67R+anoZP0OkRBiWx61GIHXK1oebX
         IOJThCmX6Y4n2r+V9jpIL+i+Yko8fT6JYv3h1/u54qP+i969Z3EH0qB2VCDZBqlABsPp
         4YcCweZjcYuRuA4Pfta+xu7fOeFfRul7IlzdKUUWK2w4C7MMXwb0aKp7TGOjErmWTV/1
         YdpA==
X-Gm-Message-State: AOJu0YwMRofBLUdFbpwzKEirTmdA2+aja+JbewogjWvlQTdT3cEcF93y
	D7OQWqFBbF04+KPD2DD0SW9Zgls/jfKpQh1lZHjhD28cfACljez9B30pqQkVM6r126tds2cvMgr
	b8rCBtEZtTxE4O+sdYbz+10LnJzRL7UNriwJcZeGE3M8BLSlliCdhEXVDBAaTqxnWXx5E
X-Gm-Gg: AfdE7clPyOwD4MtNhy+oZB6asQlRBqR6JcUsNexBFljwwqiobgOBtBhAOHG9z7Lzcus
	Qa2C/tj3TCVSgk4cStYF0pVbw91rr7BO7NJKe+/aAd1za/+cACeYUxSgdvTZS3j9xD67gC/tMHd
	OczZb14Lf/CwLvkxYDDvfMD6MmtrkRgLoSlIz65Bty4861HJztPChrGKI1wDUZXyNoiVuppI0qt
	CBP32OpYeB242Yb1BP5Bio0/lrEfj1cjhF6YCP/J6MivX3I419eg+1y3Yx3uALsk7Hmd6bcItZY
	6TVNuSRPyqGMtekRxGfW4RCIXYWsO4lm5OLcH1zmR9NWSnYXQt86EAYVn8rQ3cj+YAJ7jAf0xDq
	fBav+ZatgLnscJMl34739qWM9QtTFqJQOL9nySx/u47YJhnKUDg==
X-Received: by 2002:a05:622a:5592:b0:51b:ef2c:7bf0 with SMTP id d75a77b69052e-51c8b4095fdmr37755501cf.35.1783532981917;
        Wed, 08 Jul 2026 10:49:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5592:b0:51b:ef2c:7bf0 with SMTP id d75a77b69052e-51c8b4095fdmr37755241cf.35.1783532981529;
        Wed, 08 Jul 2026 10:49:41 -0700 (PDT)
Received: from [10.243.141.238] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada04d04sm359763166b.47.2026.07.08.10.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 10:49:40 -0700 (PDT)
Message-ID: <c4cb79ac-1f90-499d-98ed-94ec431d9368@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 18:49:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] net: qrtr: ns: Limit the total number of nodes
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        jeff.hugo@oss.qualcomm.com
References: <20260409-qrtr-fix-v3-0-00a8a5ff2b51@oss.qualcomm.com>
 <20260409-qrtr-fix-v3-4-00a8a5ff2b51@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260409-qrtr-fix-v3-4-00a8a5ff2b51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE3NCBTYWx0ZWRfXyC16us7SjRrR
 jy1O+iH1HkGVGryDKK+7TStjaF8AJ2R/QrZxM1yXzovL1MmpnHqvG1W7GVDfdKr1HtKtqGMc/Od
 w1DJOxeqTCDKY0xR7goxuE7wwYAS0RzJgoVfh4hYN0juXIzmJyOz72kxm2GiCXgDQcJGSEs/J4y
 LfwkA2IqHZfHXcC/PF4Jlgn5IchoIMVxk7hkQeyCGiDac5+1DVchqdsx320G7RZKbZN2CvMHUNr
 6SG5KXplEDpuRD4+JNOyAjOIQyxmhUgTIDQ3YKDZKAFQSLy/E5AenNQrB1yh5ofYm7MzAQroUp6
 pods9IMQq/PN1BeMEG+Fqi4HSo+1lKBC98CJfk8Kj09VBKKrQ16fE0d5jQ/hNuyjC6mdtcQlzjR
 4CAktWvw7d9beGhiWx82l6arHN1M/jUbuup71N99RWStUoTpUUWmJzdRHByEtDNbuhRt1Q8y7pz
 Ks5r3ewPqkKBRw5Dfrg==
X-Proofpoint-GUID: o1S-DrB-1X6TDbuIn91ABvJ5EAE65VeO
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e8db6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=iDFCKaCMZfxtLc4CjNwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: o1S-DrB-1X6TDbuIn91ABvJ5EAE65VeO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE3NCBTYWx0ZWRfX+lI3ARVy4c5V
 YnUVbubFvODd06zWv8Jwb8xfPFM1a4C9+qlDZazZS5evkLHdhximR2CCiz26nCTOJ2iTh7uS6D6
 A+ppggEm7o5jMLGR7GHwnV9SJ7MfwqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080174
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117785-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manivannan.sadhasivam@oss.qualcomm.com,m:mani@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jeff.hugo@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[youssef.abdulrahman@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[youssef.abdulrahman@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85E8572953D



On 4/9/2026 6:34 PM, Manivannan Sadhasivam wrote:
> Currently, the nameserver doesn't limit the number of nodes it handles.
> This can be an attack vector if a malicious client starts registering
> random nodes, leading to memory exhaustion.
> 
> Hence, limit the maximum number of nodes to 64. Note that, limit of 64 is
> chosen based on the current platform requirements. If requirement changes
> in the future, this limit can be increased.

Hi Mani,

There are AI200 setups that can reach 384 nodes (192 * (AI200PF + AI200VF)).
I'm not sure about limiting the number of nodes, but if there's a use-case
that led to enforcing that limit, could we increase it to something like 512?

Thanks,
Youssef

