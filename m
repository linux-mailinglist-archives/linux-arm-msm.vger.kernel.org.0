Return-Path: <linux-arm-msm+bounces-98639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN29BWiTu2mYlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:10:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED222C68F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A58431AF0E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604BE2E6CA0;
	Thu, 19 Mar 2026 06:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRfgi0aE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ChcD+r2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBAA2D248B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773900417; cv=none; b=psctM8lUVURJrilQqLl6Ayzkujbf04i55Q8a304vfxT2x5JvDcHAuV6jDY6jeCuytYCd8yyDVo+wuKB3jrXdowlFDXvQrrQrzA6qoWYi8CTK9+wePvjslRtvGEds8hH/FTkMyhDLxicpQWZgtulO/rPO6z739JUeaf9VdH3GwIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773900417; c=relaxed/simple;
	bh=tuzz+J+34e+v12d1pIM+5+fDBvKJYNxsgRFFQyZ9pLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHndPC3aq/8d4OmX3kjWCkLZL4I2mIHH3FUAp4ZshstKxL/xxEPRwUC0ddi1ialxRuVvsD/GfjsAnqkiwshA/6L6AEJ1+0EGWfirEJWMF+Aj8OTD9q2LtGBZfh5N6jvM6/yLjVzxx+PXhDuweguB1r4OmFuYbmobUF5eCuNj8DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRfgi0aE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ChcD+r2m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XbSu1574738
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mfFkayWmzGcGFz8dmf5cJhDTpdB88iOly1Hax9oyFqM=; b=hRfgi0aEJwFtYRG7
	mtS6dPH05P680prVpDiWzLOnc4MQKKHFRftHejvdMdzCwQ+ht634ChvNpx626jno
	N4V8UmiDUiUSVQpCUu83wAEnhmnMkS712Q1TA/Q/VfgscX0SRb/GkHJuUnR5uX46
	qqvp4dB5+y4pmGjuLgNO+B8lIpskuASnW/+RH+bNg/55h2EGt2vil6bESnG9rYpj
	P2zvlduLSc+l3rAjP3bphHNy6BJjlrmz/p1ZWYGxvMu1s8/jVDL9SCeELiCDgDOK
	6fbE0GieqCqPNHPSu5HwtNxdDmUEHnwTZFUJbx99k3fKR94A8ZpkWhGEny//dpUk
	ktESuw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75tahw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:06:55 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1279caef718so852078c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773900415; x=1774505215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfFkayWmzGcGFz8dmf5cJhDTpdB88iOly1Hax9oyFqM=;
        b=ChcD+r2m2mDdmDl/ieNwx7I9908DfTRC+ViwmJSDjAC7F0xclevCNziVJWaKgeKuuO
         aMWpdz+uQXUlgrWeiNpRMlF7KB4EEdRZQStUaRwCQq6gmBK6CAS9v3mGB+QepqMiz214
         4LWlNpcILCZ/ZfxsC6KKttiVOJR4cy5AYmSlSbLrKln4o2D4/b3dVbWmzMQlWElXeT5y
         DIIJd4yyJPX1K41MAAIUBkCTuzsno+xh2KFoR9Eewe0aPC0ExAWR0DTUZ9KwuOUimKHU
         kFepf1WFK5SKE1yH3FchBAxmKh9n3zW0x+b7OdgmgBzJsPfab6bJTSqFI5IEFw6Ynsl7
         rAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773900415; x=1774505215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfFkayWmzGcGFz8dmf5cJhDTpdB88iOly1Hax9oyFqM=;
        b=rfdDEFLHblV1LsAPNVsI03oQ18uiDWuUbp06kTMtx25C5lIO/zBN1fkTX/YUNjbMoC
         HLnUzEpHyKgk7eVEitNfE+pXJ8fZUKVUghKcsG9y/gAxRdAuJLlzhl4AY1BB4f6TzZ4b
         QFwLPhmJ4anPAeG1FVcU3zYBS97ecUfJEIb12FxGZR2vmnbzLgFFjSd4PpmRSRwRcLeW
         f7TG2PZl961r6xqd+jUEQiSZyhbElbT5Jk4NgxcSo6si/3Y0Jz3tJBm1QFyLSH+LhYUQ
         CvdDe2dTcF+WTZEkXWrNRiBkOCs/fUptW3PfEMErs6PRS3Sy1rhydZgTEgVudzN7SZyh
         ntbw==
X-Forwarded-Encrypted: i=1; AJvYcCU4dPGhsh/bQOrr18wRv2CAHpG1QvNFl9cOmMCzWfvbLEtyc7OVrTKso8OyFzOTWO7NAD5yaLi+cyijKf46@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8uWKii6ZBjRrTv+wjd/fj+KNzZm1LMKnM/ZzK+PxlhpukThS
	S8c3yw2+84evRjfTdYHQQtluYwy0auVrvHsP+v7NY9l6L+f9LZsnz6dZJisV7Polnpy6DZaAzf7
	wFtt+NCBdl80xEMbtofs4VfdLY6tPj7kSCdmhsvIoWdk60tUnvKyQ9Ij8SAMw818h7PgQ
X-Gm-Gg: ATEYQzz37yBunwUB6zO/s3u/jvvk7+iaiMbi7b8gx+1SdjCy7Md3ATeW/vAF8V7Eqt7
	ksBjavNAXcwjCQ3AyeBoNH+hLxDay3dTpYM0vmDZ/71JOngZ3MVxEeg8T0e93Qt1CObhx5dDJkV
	zoTtuiaJ70dMZvNc0ddlUbCF0tUkEMg416/EJmlmtdhcGoIdfeyGnwkxYSCRV16Jl4CykV3AnWG
	/hgyW3eNxA4KjTscp+azNbSmPYzlRoITDnKowuyPX+WYR6b5N4MNmqE5VB4A8TLPUSGuiKSAgJZ
	MapWyJ8GZqggrWPP/gofcAmXkJuZx2am44P5Kb9AxAQKhpgecIcRnEFMvSMQAHbi7g5zwhLhDUt
	QcQHcPj7WB/T+hNBpAPe0hPK0lP2B68KLu2fzpNf3Hf3P/RF+mG8orhTq3PxcgMoqr1N9BhJmDi
	c=
X-Received: by 2002:a05:7022:699f:b0:128:d450:bc76 with SMTP id a92af1059eb24-129a712f2ebmr3146742c88.26.1773900414682;
        Wed, 18 Mar 2026 23:06:54 -0700 (PDT)
X-Received: by 2002:a05:7022:699f:b0:128:d450:bc76 with SMTP id a92af1059eb24-129a712f2ebmr3146716c88.26.1773900413990;
        Wed, 18 Mar 2026 23:06:53 -0700 (PDT)
Received: from [10.110.94.9] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a6b5f7ec0sm770542c88.8.2026.03.18.23.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 23:06:53 -0700 (PDT)
Message-ID: <4d6d2597-df3f-4421-8760-ea59a46a3b39@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:06:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_qca: disable power control for WCN7850
 when bt_en is not defined
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260319031040.4096297-1-shuai.zhang@oss.qualcomm.com>
 <mcjloavd6jhinb2wgfwihsdtbay5n7zv52tn63kzrabcqwyp26@mh5aet76kl7t>
 <1603a5b0-8edd-4c31-b2d1-344ee7df10ac@oss.qualcomm.com>
 <whqo7o6fu6mytf3hpdrrirptx3fpprnp25as3dnam6n4fo7tjq@dolksuaq4irz>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <whqo7o6fu6mytf3hpdrrirptx3fpprnp25as3dnam6n4fo7tjq@dolksuaq4irz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NSBTYWx0ZWRfX5cOB4z1Eak4N
 oM73dmvnFVjnsga6AKBN/Okzx0392XGSKpKs9ljVABCyDc5PREaAXJDUnTRvJ40lsEwt4MR1juZ
 PfO8U/d/4leTbYQNdeU4eqgGvunj2Wed8LSMkq6nUs5PYl1Q7+muald9yfyd/7SrRX5xRYQiaSM
 +3J6vbV25yw//seQ9+Y8ZZ8lUOL1jNPZUZSp/SrrRpeOXe7aspgQHKJ+yi5ndHp6xdBF9XYpbCI
 FxJTDUyFQVl5EliWj8YxRzkFW0u75NFbCInF3xcIALahkQ9oVwEeKyw0WgKMLtfEobJeuqGwA3S
 9389j91QnxL2BnzrEOAYuNp2Q0hKFanoFAcomqXLi+XMJKQVx1901Y/fnd5wCH5eWCvzv986zcr
 qQ5y/eroVRIoZ7k77/2b94LvtTRGPzW0IHwjt+/E7k73bcVXlYAUIJ5KY4pYvXqfYMR443J7G5x
 Brr5p7CAj7Mbp7BcXbw==
X-Proofpoint-ORIG-GUID: ttL1N3JTXb_IExvFZvxCzn74wCGMZNL1
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bb927f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hRsDS7zAxf7RtXvUq6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: ttL1N3JTXb_IExvFZvxCzn74wCGMZNL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,quicinc.com];
	TAGGED_FROM(0.00)[bounces-98639-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6ED222C68F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/19/2026 1:42 PM, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 01:21:58PM +0800, Shuai Zhang wrote:
>> Hi  Dmitry
>>
>> On 3/19/2026 11:51 AM, Dmitry Baryshkov wrote:
>>> On Thu, Mar 19, 2026 at 11:10:40AM +0800, Shuai Zhang wrote:
>>>> For platforms where the bt_en GPIO is not defined, software-based power
>>>> control should be disabled when power is managed by hardware.
>>> What does it mean for this chip, managing the power in hardware?
>> bt_en is pulled high by hardware,
> In which cases is it applicable?


On platforms using an M.2 slot with both UART and USB support, bt_en is 
pulled high

by hardware. The current platforms are Lemans‑EVK and Monaco‑EVK.


>
>> or described in the device tree as a
>> regular always-on GPIO.
> Why?


This is equivalent to bt_en being pulled high by hardware,

and it applies to the same scenarios and platforms mentioned above.


>
>>
>>>> Add QCA_WCN7850 to the existing condition so that power_ctrl_enabled is
>>>> cleared when bt_en is absent, aligning its behavior with WCN6750 and
>>>> WCN6855.
>>>>
>>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>>> ---
>>>>    drivers/bluetooth/hci_qca.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>>> index c17a462aef55..4512ff7cd0c0 100644
>>>> --- a/drivers/bluetooth/hci_qca.c
>>>> +++ b/drivers/bluetooth/hci_qca.c
>>>> @@ -2484,7 +2484,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>>>    		if (!qcadev->bt_en &&
>>>>    		    (data->soc_type == QCA_WCN6750 ||
>>>> -		     data->soc_type == QCA_WCN6855))
>>>> +		     data->soc_type == QCA_WCN6855 ||
>>>> +		     data->soc_type == QCA_WCN7850))
>>>>    			power_ctrl_enabled = false;
>>>>    		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
>>>> -- 
>>>> 2.34.1
>>>>

