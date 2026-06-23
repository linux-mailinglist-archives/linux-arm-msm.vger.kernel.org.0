Return-Path: <linux-arm-msm+bounces-114153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eE7KES1dOmqz7AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:17:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D16B62D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:17:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KvTMnO+y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G6rzED1A;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114153-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114153-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8C523056FFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C74937106A;
	Tue, 23 Jun 2026 10:13:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E912C370D43
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:13:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209633; cv=none; b=YEBK2pRazmu4NyhVqzD515Yj8kMfKSvIUhgTuuiN+bPCrakios6ehY/xnWOsJxL1FQiMSplwnPFAPu/Z+mGIGZNrd6ntNvf63imHwJlTeUkBRPr771IO5agF0s/G1s2avoER39uB4P4Bon206YKnfZvM17HR0v0yLbB0brsLZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209633; c=relaxed/simple;
	bh=EJXaXSaBfHLWDhV5TxKzmZaa8c2UwWzoscLqN9Fbqfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0gCaWnaNnzm0MU8FMr801uXFynSeghSuiYcuRv32WqS6XxUDTDCoKxDiuGt0qqCfcBFkAz2eXXbwQwKkPpiCy9OD/HYPzlxF9MbhNiyGPBWdcJRG2qrf0IN68VlAWJLBX0TAREvznn6SfoiJebFsjl8WeCSAlzhvE3+uCjrYbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvTMnO+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G6rzED1A; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA3Ito952871
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJXaXSaBfHLWDhV5TxKzmZaa8c2UwWzoscLqN9Fbqfw=; b=KvTMnO+yMyDwn+HT
	9IIPbGMmqupPW41TmZcBK3RqMLuQdMGhEyyfPRuXa6p8UswpvW9Zye6NW4QDKJQM
	qmfcQJcte26IC0ymRlYf4wao0UX6iYt4X2t335LM4wJ3RJjEuXKDhhJpF+CWoBZP
	VDuTIry9BU4d8rEbtM8NYlRQ1giEu+VV3Qy2Ymk5mxK2Awkmq0sJchROCJCaPEKx
	SCYKgVG5ShXRENpennIoTiJF2ey95k12GdKrfeKqCCApYOQofwS3yvON53YCHMxR
	4FdeVBMtX8TNTMgKcFsIYiDpfdG+NlDjK6hmBQ1gqJjf4g6Ta41d9xIQGUnaeRMo
	y8ucIA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28r1uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:13:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84535861e69so1012080b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209630; x=1782814430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJXaXSaBfHLWDhV5TxKzmZaa8c2UwWzoscLqN9Fbqfw=;
        b=G6rzED1ABdBkg+jaKCok0a1tA5B3J59WpkLaOO5BCesHgqWK/SlOSvSAQFaDQGfJeV
         kly1+pzErIxE34SSGDjamvWXSkPkXeDwZZXXLsiAXqBQiGbk5fRr0V9M0Gb+qlIbeWvo
         tQqTxvnpDX5RRAlU47ukz0l08/mI534Dx3yl0dB9j5X/juHAsVxoWYOx4jFPdxR+yiIK
         +wQeh66B1rfIl7lJ9Lze6XQKjw+kQT7IGTpfwJtwikRg9KVRFDVWEO49FrlB2KOtJDWJ
         eMEz3tqsqATPj/4L5jBu7RZbU7eL0JuQ5RbYYen2Em/bSLTJPWURYyfhwIX26blWglzs
         I+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209630; x=1782814430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJXaXSaBfHLWDhV5TxKzmZaa8c2UwWzoscLqN9Fbqfw=;
        b=nNXGrYnee23JRU38HItk4SEmFPyi+dNS4DcyZ4Ktbu8LDbuMTyS7XkbgAICloBU4Es
         cZFQQoCokHKc7y98BeIVepDuQIKRe55SdOKBQNSus0cD7NkzDK6LBBa0x865a1LFJ8zx
         GyO4K5CJxX22ZGRbjW4FwA1VXp0nRYqElN8Dbyi0QVMxMXGphSF74c143zuX7BWoCaQ3
         Z8v4MVxc1GYyMq6R9K5I5xIy4jXEoFEvnfSNiSC/CQItvH9TMDqHutYddLLfntum0tls
         YRIGKQdPxFVUfjXSy6m+NeRTgmzKiUlSAFOO811EGQ6uTQk9wAeYZifwrQKz9bt0SWNn
         Oc4g==
X-Forwarded-Encrypted: i=1; AFNElJ/Vo7YqgCRiDxjaAs0p080r8EQTis+5UqtKFwmH8K3i5QUTxZg8aE5VulZOw/ecCxNSUTylfxMkq5NsnIry@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/k07l7/Hv+izUWuQp4w5tCP+wjTHKNyW364VU4HZg+BUfJRd
	7ROzGt9kAsOy64gjI9FTuEOEf4Nge+TksMfHsaAnxkKiA8Szkfm8B8HHPSgff/jIqgLGJtJbT5S
	vLQtnLnpY5SUNJQiJTnkRdOYYi755kcbhz2o+a0uiaF0TtRJfKOb98cx1nlL9Ysg+Ww7g
X-Gm-Gg: AfdE7ck6H+O/XiDuYNwjh68Gl0ssJLiQm+OpAt61U6NjHF6+uIQtDSrSpmwScCtWw95
	qZ1ZjDAAcL9s0+deW2rjfFhCrhYYKqvEqMbFaI6vEg3LB/tk817PPtLqIbAjnF5c4cVY2COUIEW
	eQ2yAEpSA0r6rwA+zJRU3iYBve6sk+RF+ERWSsroKarrxphGEjOf13esidAsUxA3Kgdxf9Zdncg
	Q9qsZf8AqO0F+ac+uQSBzD1wHHABZssq+B5Die7G4V3MRbmf8rrPnbD2XKS6YbpcxXtuJzaS3g8
	w+fKrxBMzWi+R8oWkrQejUkPlj8s1JiAWIvnVkGwAcF+b99d2zHjihflxKN+ZduEJsbbB/PdxW4
	+AmZo/B7toyZ8z+gyg/ugOFx8NrXCW8EEgG45v0in+opUa4C82DJ0Ib2OWmNzAK1A/GCrtBbOnF
	24Og==
X-Received: by 2002:a05:6a00:2d26:b0:841:dc7e:b42e with SMTP id d2e1a72fcca58-8458f10e66fmr2081618b3a.0.1782209630619;
        Tue, 23 Jun 2026 03:13:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d26:b0:841:dc7e:b42e with SMTP id d2e1a72fcca58-8458f10e66fmr2081602b3a.0.1782209630246;
        Tue, 23 Jun 2026 03:13:50 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564da57a0sm11630112b3a.26.2026.06.23.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:13:49 -0700 (PDT)
Message-ID: <094d24f5-46bb-4225-b86e-4b3f203017de@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:13:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] Bluetooth: btqca: Fix undetected error HCI status
 in qca_send_reset()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Ben Young Tae Kim <ytkim@qca.qualcomm.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
References: <20260622-bt_bugfix-v1-0-11f936d84e72@oss.qualcomm.com>
 <20260622-bt_bugfix-v1-12-11f936d84e72@oss.qualcomm.com>
 <CAMRc=MemaY=ON2q-Cuzis0sZ9WfqjvBsFzxxCYRZrXeFPNJ0_w@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CAMRc=MemaY=ON2q-Cuzis0sZ9WfqjvBsFzxxCYRZrXeFPNJ0_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX8swfqdU/VWMT
 y2gTntTVPqODS5cenIURYrepxT85C0nnU/Da9Mmx//JOq+AIqkPo+eB99W4sCVxY2TUVO+b9Pqh
 tE5EsCwOqkrvs2yPkEMR6VHESVq9mN0=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a5c5f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-FsiJwt97AdDbmgBbfIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: B5rzBHnfF-ujQ40CQO7cwI0w8ERhGss8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX6obBeyJCbQha
 35So+m9YfsY8z2HczJbEmAXVIPYyv9ltsQBflaS1PL6Yg7+t7/05tLG89XPiNsBWbZEUzVmeQaX
 BcfVUmG5h8GwQ2aqVOzCZBCC1UxNzcEkMJCyG5MoncCn3I1r6ZNyXeUOHEbBZp/+v8Sixmko1xP
 j6hOpG8piyo4uQVRgw1CbValhj0AfkvtmX5xhvsspXUCK9ahkswHTcXICxo+mpzU9T8V9jj694+
 uRTFEcoP1bR4wnjyrMB8Wx91/pO+TZMJs0a/2Ttm41640mTWAV70CLx3TJbPBCAd+0kHlh23tBz
 1JS2W4sFilIExts0DsPPcIn1/ApHn07qYhbAplSaFN/L/ldGmmJnuTMNaM6DQBO0ojW17Hkx7Tc
 PKcqSOE1ErWwnfcA7WPOgldR/7vPbfCBg9qlvAi46u1a7ykJZuvl9Jm46sYL9iNKf9WxxXvsiXw
 kfbeM6FP9I6ko5klU7w==
X-Proofpoint-ORIG-GUID: B5rzBHnfF-ujQ40CQO7cwI0w8ERhGss8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-114153-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:zijun_hu@icloud.com,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:luiz.von.dentz@intel.com,m:linux-arm-msm@vger.kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_rjliao@quicinc.com,m:ytkim@qca.qualcomm.com,m:quic_bgodavar@quicinc.com,m:mka@chromium.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[icloud.com,vger.kernel.org,intel.com,holtmann.org,gmail.com,quicinc.com,qca.qualcomm.com,chromium.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zijun.hu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 900D16B62D2

On 6/23/2026 5:03 PM, Bartosz Golaszewski wrote:
>> Fixes: 83e81961ff7e ("Bluetooth: btqca: Introduce generic QCA ROME support")
>> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
>> ---
> I think the fix should go in the front of the series. Even if it requires the
> new function.

Agreed on the reordering. However, handling HCI status errors for the
reset command needs more discussion before we can finalize the approach,
so the fix may be further optimized accordingly.


