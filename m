Return-Path: <linux-arm-msm+bounces-90891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB3rDPF/eWmexQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:18:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBA69C8D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 04:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EAC75300BBB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 03:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD19328241;
	Wed, 28 Jan 2026 03:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jv9JYwrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtR4Jk38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69E932E721
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769570284; cv=none; b=dZIGCBd+G5ftsthfKKPleCl/fARWHkay0CJmaVrymhz6D+NP9ddgpQX5eO6LMYr6PzxsDUqba3cZSuRwZm5NcKvQh1PSpM28/bGBXfHB5zJM2jifd4nt1GyrB4bS0Kw29zl4B2kn0rDKT3ZvH1Z+bLZ3fXg3cHKHO7b3j/ALasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769570284; c=relaxed/simple;
	bh=xI3rOJ+0WoDEZlNXsmfPyAwcSEf+WB34/w2LHRTItSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIfVhIcj05BXMSZQWZrrecDvoYjM2cpxOUoH+JwI0J6D+onamjaX/U7vn7rKK0mIivbTo3j072O/RJFIIvMaKxp5dXI0bpDvI/qUrEKhEhhuZQ6aFfPV+qrRgBbYdChZvBmtd5sJ2E3W3RRKSuvTBSqH0iFgV1iQ+oYHI+7j4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jv9JYwrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtR4Jk38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S2x1wZ1980951
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0UtFjvW43H+5glJTfI17zUFgzb1nhhk/taov4zYytY=; b=Jv9JYwrDMekOnS6k
	Zv24L5KslB+WYHpMAHFAPQuM1mCVicEYQaVjro7gO65CEnyguPCGxHRlAKYCHjar
	wBFTj2WqNmmQ9Uk6za7Nw7NtcP3IQdkgUm76lhOFmnwW+pvGkYOH2m0ln+HbGQew
	WT8giHB1AvrlVT3zHba9ZWvb11MWDJfS48gGgsMzVFB4EW2GUO0761RqKD8w3PNJ
	KGLWqcMqhA7p6FcUFVteFY1MIxCfdX2CmTgcEbae3N9qdacpUZHyvjjONPi9qUrL
	AKY1XyVZOJzbZYogla1JW2M83ybnKEFl3m/3ehrGIyCtT0f0vkiOpI0csgOIuHRF
	AGnAVw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx1r9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:17:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so36218629eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 19:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769570275; x=1770175075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0UtFjvW43H+5glJTfI17zUFgzb1nhhk/taov4zYytY=;
        b=RtR4Jk38AyjTMV66LpVMRDxS6GoVvucvKYBjo9nLw567vwfIQpjZbG77Tvl1tM63tu
         Me1GYNqJUL5VRSxDfhLlRENJnqOwiveytm1jT+x6jbMmeHgHkcpL/LWJMKS9fzGjp4Kg
         2Z5giF7j1PwTedKKy12u6YikOY5Cm9DQE5aa5YXMgLqe6CesK5oxpDDNpMxu7ffzBsru
         j20fynRyhlViquaujKQ36swco6TFJvtbC3EvGEcN0PdHH6ovQUQAb8se11DSVbktTV1f
         TJjbzBCU7MgFtJfJvvJgOJ3bK37EJMBoUiWqTuEBORtvBphh7W3vpChQ0I/UL6zFiTR7
         2qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769570275; x=1770175075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0UtFjvW43H+5glJTfI17zUFgzb1nhhk/taov4zYytY=;
        b=p8WLltMBoqpLt1FA6QELijR/UesOnXiHQeTv++maXlmqdEeeN9YwGqe1yPEHeIeuPf
         KUH+4ri3quYJuDLCUefsoEcdVnVGCnlUYSPGQ8YA27NYdX4lVh4Hs46YKTmtD3lR/JLt
         7DkqE8W82sMP9LWX4KyyIak0tXiR/3MyvKwkATc+J9fjhimKQezhHSuuH1Z82dJiN9rX
         5ZpfLUWfplmrh+YBxAkiP0ReiuXbo3i601asmBdzl7r9dfzTeGLIlf+f924h6lx9Nxb0
         3tHEFXYBvkUmZen35Lt/qDzUXK48KgkayGGRB9F9a/4rbkiAAr0vgoJ/t4Wq1dmQ+GIT
         yw2w==
X-Forwarded-Encrypted: i=1; AJvYcCW/MSDRBZ6XtqXhPMudvj8gAX4xotxZIuHrxHu87rQ/TfbGlzXi9cZTIUI2+3UAdEPfHesAfGkAxRnD065j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/sEjilDCi27EeEmEpgnz660Cv/faX/8whlVzK+3nP8OK+GXfb
	RKSQg9yi359mxTXq/JjjUbumgcOxj1wAEtCq6NRSLH3D041xJ7FzYMzU5HEfJA0jpYXJ9fH2rMy
	I39uqUmghsY8CWShAneUPtiTS4QI+n4Gos4ZSfAwphTMNRMwU8yvJJyNefou/TivF/Vz+
X-Gm-Gg: AZuq6aLS1OfZDrLLT2N4kv/Ms3pKCjBeWE7OmvNgr5Lep/KYNwWViEWwstS2S1ZE6Gp
	9rmTJ5aOyRhD9JQ3B633FO74454B8lxBwWkrz32uaztFdodwiAgT0NSlOqyk+sZcGVeR1by8U5Y
	4R28nXASClaXfEVBfxiAa+Zra23AxP9J7ZbyVuqxMRb5Ayk99oZpJMqfQJvQUpeBFTEbmtTrEb6
	qmy3B9ATrs637dlFTM6sPLrfSwCchonEEgkuRC5wfDYBXAYBDAoEy/3oCcnQ+Tmngv/NDgTdWKh
	PHSP8Zpkng6ykfbN5cGOA1sX4hNJZxvg5M2AzBkt9NsqKP870mj6PAtfAWT/WSBU0SD8SiLze6r
	wm/5nRxP8HhGQmxUPEk5PTytbEdCzncqNccpxGcje3fZikrCbAxpkfXmHp4Q0en72
X-Received: by 2002:a05:693c:2c07:b0:2ae:6146:37a8 with SMTP id 5a478bee46e88-2b78d8cb642mr2401393eec.2.1769570275202;
        Tue, 27 Jan 2026 19:17:55 -0800 (PST)
X-Received: by 2002:a05:693c:2c07:b0:2ae:6146:37a8 with SMTP id 5a478bee46e88-2b78d8cb642mr2401368eec.2.1769570274680;
        Tue, 27 Jan 2026 19:17:54 -0800 (PST)
Received: from [10.110.38.177] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm911226eec.3.2026.01.27.19.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 19:17:54 -0800 (PST)
Message-ID: <ca86ca83-1951-433a-9903-a95dd4be23b0@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:17:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
 <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
 <7b9fec28-2272-4ff7-9575-76e72cecada5@oss.qualcomm.com>
 <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
Content-Language: en-US
From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
In-Reply-To: <l2ib5kalse4nop6e6ak5xronejxusnprl4qgz2wxvdw7wpzw6e@aa6fn35id4we>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZHs3Iixoksu9rDqP8SSxf6GRHdR_V106
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=69797fe4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4l2wOaegfIFoHesmqJYA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAyMyBTYWx0ZWRfXyOPG/F7Zz+0e
 W2SB0Blw5r+/zzfO+Cepc/e3tsABjS8GtDrdzkZho9wiqrKLTg27dVGX76CezckhUR+bY3kW5DG
 AaxVSrkPMZ6SB996gMB3hMNj872D4hJE9954POKa456pWpIsLROqCmGCPjsX48QkQOVbaqKs/qs
 3ggQsdXajI0NSjqnzssKVMb64pjlrMahUFg0vzGgCH3oKa8o8TEKcDMtWTz+cWYU5IJssltJsCC
 v4MmJPaDj0UV/niMQ2plOpeWmkabacxzh0+PG4TcN+R1B1h3wHFkblBc0P8s/0q40nz7kYGqcTT
 dXbVEEPl04lfxZQnTcPWjq2ynuRK4AG69C2WJwzeT002kEWXPsycH+mtiM5ZczscpE+lnwQalDP
 qjcAGlu0wQc3JiQzCJqwSIZwjIv3ChgIpJs8E7iWv9NOY7pu0aK7nNztQ4cYgYOc018Khn7yzyM
 gj1GGa9/wrK/JRJANVQ==
X-Proofpoint-GUID: ZHs3Iixoksu9rDqP8SSxf6GRHdR_V106
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280023
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-90891-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mengshi.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CFBA69C8D9
X-Rspamd-Action: no action

Hi, 

On 1/27/2026 11:06 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 27, 2026 at 10:32:58AM +0800, Mengshi Wu wrote:
>>
>>
>> On 1/27/2026 1:51 AM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
>>>> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
>>>> data structures to enable Hands-Free Profile (HFP) hardware
>>>> offload support on these Qualcomm Bluetooth chipsets.
>>>>
>>>> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
>>>> ---
>>>>  drivers/bluetooth/hci_qca.c | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>
>>> Any other chips which would benefit from this flag? If you are setting
>>> it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
>>> set for WCN6750?
>>>
>>
>> Thanks for the reminder. This should also apply to WCN7850. WCN6750 is not
>> considered at this time.
> 
> What does it mean? It either supports HFP ofload, or not. Does it?
> 

We have not yet enabled the WCN6750 hardware offload feature from the
software side. Other chips will support this feature subsequently. If
I add the flag too early, it may be kind of misleading since the feature
is not really ready yet.

