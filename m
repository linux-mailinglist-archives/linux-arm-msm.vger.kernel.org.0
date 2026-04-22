Return-Path: <linux-arm-msm+bounces-104112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CzqBTK96GkHPgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:21:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56A445D48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CFED304C10E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6553CBE96;
	Wed, 22 Apr 2026 12:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tf/vTSHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZuIWbCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDE23D2FF5
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860242; cv=none; b=OafTpcjemLQ5v9N0WTv0DTkud5l+32igB5D2P/vgmqNhbNVO/aTdwuY4PWreYcH1sNnREscXkd1HfS3/KfVfyR7QNFns0hX5RPXvzESPDaqS6UclRZ4nfV1CT2+UU/bW+pB7xK3fqlAtihMBnfVlsKAklcgU3F8ZDkTZ6X0dH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860242; c=relaxed/simple;
	bh=MfKTJ5AFYysRrxk2JQ+v9vd1eySQzwAgo81gCkk4rXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mia9Jxqg/1V0oVd+OlQYfDJ1rDxiHyUy+aSNj6v7ksUeAwmmJpIcRo0Pfw62qLHs5RCGN/eIrVb+lKtHl17JSIkIHBQkVesYOJsUF7VDtvcYMURqods4cfCmCTleBPEH41gSJnVf4VSK5eGHhEyK52CxprZYp96ziDkpLmHJw8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tf/vTSHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZuIWbCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M98whv1081113
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWkFrE7fA+FU3yHhtcDWCr9hztUpx1XqyOUuint3UdM=; b=Tf/vTSHKXBQRMrZ3
	u4P8SJS/FnAQL57fs5TcrEM1JyTWgO/Zu2W9JnxUA+VEWxpqLpBAb9XCevAPLU/g
	JvPMpxnlww5ZjEB1n4nHGwzx5UdtAgpkDH4The0qlfw5hGyiXHYEVdF7ipMpGZ3l
	gcp5uFLH5BSI9mvaPR5k31PgRUf8iC5BJQdZjM2ICvMMYdr2S72OCV1r66R8XdPN
	QwHMW4HtMpq3vPN9LojJjfBsJwSyjb8uhgFU4AU0cQrg72/PPsdDlRizo5RFXv+1
	s+7lB6/d4jZw6lwx4C2i+6by5EuzOzLiyV7e5InUfm+Hof8dEFkRzkB7Ome+LdWS
	CVs51Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeng3bd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 12:17:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56e072ac05bso483212e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 05:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776860239; x=1777465039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWkFrE7fA+FU3yHhtcDWCr9hztUpx1XqyOUuint3UdM=;
        b=DZuIWbCfhi1dA1epXH/l/DVEQh16chX72LV+BbI7OpiL99ps6EMTlWqypPuIX4OKPG
         CHGrP4QfSbAbkHyPRsAbBqnvxy4+ozLUowT2A72YmXwhqeCkYnfvP1b97DpR41nGWWiy
         vJy4//bSVL+gq6MaSaxMhebV0/fFFwgQVqWN8KuC33J1jqHbViy3WY1uEYSPobgh0Poo
         fmE7WCp2R/njry9Kwry8qsanNmfnhPKmrIIdzAd5BdpG/tVESr03OY6Zfe3NArsg3+ij
         xPf6PzCX7EgqxQ1rnHLWP2kCrkoiD5yhl06WGk2hspkh2GvKth9pJ+w5gM7qbj7VB6ST
         tyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860239; x=1777465039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWkFrE7fA+FU3yHhtcDWCr9hztUpx1XqyOUuint3UdM=;
        b=ls8wJHk01R5EbGr9+cnjB4LgO/hp8C3nmfbKuP4G4aDkEKvsSQFE/AFQ6BRlMMExXv
         3vrsKz/3c5jgxH6qcfnobJi5qLpTQWH4J5c48BaRtOV90O5mnB7aDgg96VNLZl4UtwrI
         MP8jeckdCDmK2g23CxXrmOt9qe6wDGFbdkRGglIJwGRNGvOb4qcpUUQgXd56B0QBK8Yy
         hepDa2qGKT4ZzSEhANVnQwub6q1Xt3KZ+vxiwd9J6fWrIRVU0qCNeTwEfpISiW88RTSJ
         gGC6+Qbw4yKlmPnEnH5SunvTp45kz0zJDkz0MAADLoAj71EmlNEZhZ54DlY0Sf1rI99f
         3dPA==
X-Forwarded-Encrypted: i=1; AFNElJ/JR+K7Am38JsKJj0X92+iZrBIDIb/W4ZG10lZP4qvdfKy0jPobwN/H76an3A76pg5qKCV9Npxmvlo2Vlfs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7FoCTHqiia33wpCQsRjc5gMrc+2U8oyUII6so9z2OmVSxIMIS
	etsk3FTUWs3ua74r4XtgnpfrUT2TmVlI/4yL42+bfPvr7Cx8wDDPXNC9RnOvwjAIs06A8L4KEw2
	VACYYwHYd7YEr4J28AFwDG7RpCWfOQA++JnZraA4UNFUXJqt1hEVIgSsxYBJ/lYwUuOft
X-Gm-Gg: AeBDievz5iX1gazH4NmsFMImb/vzhwLoDF8xWxJ+avE1BWeA9QysyAmqAcbKMWZMzy6
	f5vlFXou02OR7nwTgUnSB+J8JP/KPzOU8wNTgcYi0F4ihO6mYrNmiOXFDbSpMZkS2Xuwecj6VDw
	FDrLe3Zt3/jRIvmUeFJIJwB4wl/rxFCBXuE4MSEpUZIMDnZLwS5QTOqQxzrtlQ1WLhC1I1FCyeF
	L4JmHxyp1OsQGMikxjz4u3lQsZFjy5QtSyvlqXq1eA5jPnRobK/ZVAXGNbKQzkEhFHF8pqWUOBh
	n0V2S/88GEvtJX/yHZpnzzuKYUQQ3KoycQrpFVFKlS8o5818dKvZaiA/q+R2hoJcaofZL2U+P00
	VjDALvkqliS0tEBTUTbLnUboHBt4aLtPwHMbzsK2FHeTXX3isY7oEa78QlhnmvpddmCkrJhQbg+
	gCPjYgrnhdfiz4eg==
X-Received: by 2002:a05:6122:6001:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-56fa55afa30mr3725093e0c.0.1776860239336;
        Wed, 22 Apr 2026 05:17:19 -0700 (PDT)
X-Received: by 2002:a05:6122:6001:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-56fa55afa30mr3725053e0c.0.1776860238852;
        Wed, 22 Apr 2026 05:17:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e2d2sm3095513a12.12.2026.04.22.05.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:17:17 -0700 (PDT)
Message-ID: <fa725454-2de7-4e96-a828-ecc229a57371@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:17:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] power: sequencing: pcie-m2: Improve PCI device ID
 check
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
 <20260422-pwrseq-m2-bt-v1-6-720d02545a64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260422-pwrseq-m2-bt-v1-6-720d02545a64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CNUamxrD c=1 sm=1 tr=0 ts=69e8bc4f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=q668qMPRPbE92s5sCn8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: XqU4qger01qJ3nIrKLayXr-T1iLeVjyj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExOCBTYWx0ZWRfX1QvrTgvJW+fm
 G145vUCFgN4HvXKDj4YvWXEKPSQqwUDwAIrCxfSOMNZ7KL79din8wLD6gMhhOXbVPKz13LJp0Uh
 DDGSGstfjKjWaSTn+RuTt/VbrjsZbMN5PLPbziW/AYJHmD0nDwdYm8zGwdQcykJR/EGOfsyfyHq
 Er4znsUsXotW5XZ21hhxZ5rrddT8U44YTqt+4WQwx8bkGq13x2ZYZnDzDu7EQWXYzEHMUyvfGx7
 LKVocRXfb3sQVyVSgXJxgVSlXa9a51OufN59jGBMohPIcz5XIP+ReFMi6jIshwqvBuwEepHAKCu
 kfI/jrCEnCbla03+7I5VDyTrSjD5IZkU1aruFVq1sRe1nb/ioX/sWuP3RZIXAZOB2jCp6prJ6Ky
 mH9O5UJJebkSN0yn+JbEyeaILTj6zzF/1ZGhzy3B2ZniqHl0Qt08ThBcZPvYGa4myXSD5KTZoiN
 WdrMqPW51sKFEnjBJgw==
X-Proofpoint-ORIG-GUID: XqU4qger01qJ3nIrKLayXr-T1iLeVjyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104112-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C56A445D48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 1:24 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Instead of hardcoding the PCI device check, use pci_match_id() to check for
> the known IDs using the pwrseq_m2_pci_ids[] array.
> 
> This makes adding support for new devices easier.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

