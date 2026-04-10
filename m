Return-Path: <linux-arm-msm+bounces-102620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIo3E1a72GmmhQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:56:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F6E3D4655
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53265300A606
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DD13254A5;
	Fri, 10 Apr 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kzugPAnQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXUEBXly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5263A9635
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811411; cv=none; b=ZrUFoYD/g0xEhyy6R218jgxHVF+q8xq5Xr1QiE0L/hKhPJOzvCL866JpPHth2CXsiCWFAskZGOO9gUtZguyUVRTu9H4gpJ8pNEQPYh3uCAUJE+Kq7Odj/RQLOddQtN+LZ3T/frdvfxk+vIpca6u7HDONllXmyqdNBCYVRnpoHI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811411; c=relaxed/simple;
	bh=4ll411lMrhIlzuNnvMxpl7djAMvUCJvTPlpnDmRVExo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d0wrpBET1iADS3tniFFy21NdEEn/xbkY+wR3nTAYYwhoUwp84KRvn02dVAXYq82S/XdVr9oACKmfqvovG6uE5qDD+FJR/4L8Z4rjZqrjVGcll1AsAVbjsO1HbKgF4FcjswI96G/FkNRoGrDVZ0GEQ+H2vWxFZWS2gSnZJFNWc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kzugPAnQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXUEBXly; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5oPU8709117
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DpL5uUa/L0RcqMu/HKlHy5vqEr9XMka9y9pgSUMJX/I=; b=kzugPAnQnU0tgLbI
	wpNJl8YN+Lalu7vBgLTIiyFqTiznEHZJXgy5fg3a/eNjj/RTmVy2SdCTpEJdp0nz
	j50LPD/ZUtkrLz/NoL3Ak6ssgYsTR81CSmLXgHsi6LmVl3S2IHiXf7P2w/B1+xBs
	VwJ3lqWsI7h0r+ARExdq6HHFV+9fMx3WfHPtC48XmlZPlwyrB+CZWZpjvGp1km9F
	PDJFDMzFgpHivpZRIP4NU/CaTMzR8J4i00XLda90phSkLuutvAqOG9c2nuspHTHT
	eNw83w8dJyc+MQUA+gRnnhMTxvqD2fWgKFpQNgUah89m9NMFnh/nEdd3y0YTxZLH
	NrMXGQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudj0ne8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:56:49 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12711ec96fbso1401982c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775811409; x=1776416209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DpL5uUa/L0RcqMu/HKlHy5vqEr9XMka9y9pgSUMJX/I=;
        b=SXUEBXlyDPCWaQkxKZWcPDUTbRZofLxiKx3mUTDobDCDgHnhr0/XoXFpZ7UV4JwEvZ
         nvaFyIlXG1zYJ+tj02CDWDIEFYDRbk+4WnMOSS7rrPckLFUpjRfq405N+XXdodtHjZVu
         ZyPvoLNc1z8MCGwFXiyIhfajZw20Jle9GNsUemMQelEIOFuTta8Kq4WEVBUxHldmSNI6
         dQ/7L5YhdDFinu6lFY/Bm5BAkzZCwyMjgg1oERMsHrPal2atAMjJPd9f0MGX2RbvNGz2
         hIOYGHxvVcFLHywoqYHZXGmAdyzJe6TCHE0ZtK6FaV5GB4JBjHDHkHfU3E2F1b1Sw7fH
         KfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811409; x=1776416209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpL5uUa/L0RcqMu/HKlHy5vqEr9XMka9y9pgSUMJX/I=;
        b=onwDlEFaDVfMWCtHGR2KTHUHbK98XWaQA/7xOzvzfMjgE9fFO8yU3LsaCOx7SgPvyZ
         ur2HZJ20uVRTX27vW0N+De7QjLkr8Hlvoa/oP8gAO6pb2jO13Ko7OV9KpRw8IQLs2Df7
         4xGG9CPyArBArIeuNVPj6igqI0LXbOLcTbkQzpHEm24w/3co7DcZQdE0BcwxpcKXhAh6
         Y3lSRnnBdm+0sj7UsAFMT16bH1bwGduEVw0+x/0YNvSyYl7NA5ngHn6uccYIiFDj+F1e
         6x20jxlRxpWbNOVXDTgYmMzbe21w9zWQMGDPkrS6Y4Df/LbvePPNFy2qgDK4HS+iXCtz
         7VWw==
X-Forwarded-Encrypted: i=1; AJvYcCUcohxD4ghkFpvB5ASUI5hGjT+WfESdUFGSStJ9iPLPs5rIdwqDAGuF23TNd7zJBCStemExJbU29ojawIAG@vger.kernel.org
X-Gm-Message-State: AOJu0YxAKmscl14asLd2o1mmh0o1aXDjWzdrwfhjIHdzn6izgoBYBMoq
	+mOmELmi8Zv25uZ8aC/7XAEwgtK1qSp18NUcyuWTOSMaUJfStYZpwgUZYJU1AquZs7/sHXSU8vA
	l4O5OJj8z5d4Kh+iOz4PJxDlRFcCZ598vM3AnnjxqBnFXWLh2j/EHjPWFZN6F+zHVt0f/
X-Gm-Gg: AeBDiet2NKoyfxVARpdtVAPx6QannqMrZHbgAmdkbwnQn3R/Qkzb5juutJbNaCy4bEd
	jvwFU9uheVpkmV0was3GimhdpfsP4y/P1yOJa8sn5FWAcc7MqAm8p9BNbxdBtPB3QNZxoMUbEzD
	nPye84pJ8GW2ZXM11FsAPXLWlD7NwSMDnPs2X3IrQBQ4jZiQnc8JlCaZ8W0voCysyV/XSOIYqAS
	c0qGSwA9AF6RI9saE8hXxGSgPeGN3Fc+L+RH+LQhXgejXxvXRy29kOoW+zDvBEM2kXW9cGoUL/W
	RP1F89h/79AGLghgRBgmpxJWD4kCE3e/SlovlTvRl0Mcffq3LHh+zqFFIS6x8T2vG/Aje0JcqIK
	fqjjjnzzUQ3W3fdCtKPLNGSW0PJWI0IM7A3gIAKC9ZqJNLWpi
X-Received: by 2002:a05:7022:e1b:b0:128:d107:da0f with SMTP id a92af1059eb24-12c34ea9471mr1340452c88.10.1775811408989;
        Fri, 10 Apr 2026 01:56:48 -0700 (PDT)
X-Received: by 2002:a05:7022:e1b:b0:128:d107:da0f with SMTP id a92af1059eb24-12c34ea9471mr1340432c88.10.1775811408369;
        Fri, 10 Apr 2026 01:56:48 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa5257sm3342942eec.9.2026.04.10.01.56.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:56:47 -0700 (PDT)
Message-ID: <f6a9419d-5e63-4c36-a7e9-aab6ac798703@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:56:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Bluetooth: hci_qca: Convert timeout from jiffies to ms
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, stable@vger.kernel.org,
        Paul Menzel <pmenzel@molgen.mpg.de>
References: <20260327082941.1396521-1-shuai.zhang@oss.qualcomm.com>
 <CABBYNZKY_-QgsenfU4hpyQ1+87rXDS13wFueN2nX6Wojy4BgHQ@mail.gmail.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <CABBYNZKY_-QgsenfU4hpyQ1+87rXDS13wFueN2nX6Wojy4BgHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V6fzh514QYgDhsIUwz1xngAdKlTKrh3x
X-Proofpoint-GUID: V6fzh514QYgDhsIUwz1xngAdKlTKrh3x
X-Authority-Analysis: v=2.4 cv=cKfQdFeN c=1 sm=1 tr=0 ts=69d8bb51 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=mEO4ALF7hCPe5JJGosAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=TjNXssC_j7lpFel5tvFf:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MSBTYWx0ZWRfXzUpIZYJO+LwW
 F5Ej6/1kSaV++LeG4SUry2kOStl2QUmwsBlMFxYWqFrII0JasaesRcF2rSLcf7O8dQVPihv3w5R
 RihRcmvAKzrRPUGWYTXGoe3QdS3O7yJeXfy3mGSvRhaDmXwUSHK3KQWlA5EM8Gmnc5Zsc7Ay8Ky
 KniXaktqVaMb4O3sSUFpwmBmELD9iFhXUTt1YWpNJwYG/9LrUk5h49MD5VOufN/drJ5iTGQiHOB
 icYjZFgcCVqeu4ew6ayYq741XP5AoPNlqJ8yGMTA8r/2G5o1G+4lrNH1+xuLG+Us6oQpGQyWihV
 6Gi3CmXbVEHHZEvJHon0XO1EsC6DqO5yUzz8ontUYgSs1OfnrhJKuh2DBcVfIdKzZ7D1ptRcNF8
 kZyQ5ojadOYa7beeSqfVtUd3y3CrMVlzNBo9c7oeKwsnU65rfV7Rk5GbF43AvUGTrqmowCWHb9Y
 fK6KsKPvfO89+ApM5wQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mpg.de:email];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuai.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2F6E3D4655
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luiz

On 3/28/2026 1:53 AM, Luiz Augusto von Dentz wrote:
> Hi Shuai,
>
> On Fri, Mar 27, 2026 at 4:30 AM Shuai Zhang
> <shuai.zhang@oss.qualcomm.com> wrote:
>> From: Shuai Zhang <quic_shuaz@quicinc.com>
>>
>> Since the timer uses jiffies as its unit rather than ms, the timeout value
>> must be converted from ms to jiffies when configuring the timer. Otherwise,
>> the intended 8s timeout is incorrectly set to approximately 33s.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>> ---
>> Changes v4:
>> - add review-by signoff
>> - Link to v3
>>    https://lore.kernel.org/all/20251107033924.3707495-1-quic_shuaz@quicinc.com/
>>
>> Changes v3:
>> - add Fixes tag
>> - Link to v2
>>    https://lore.kernel.org/all/20251106140103.1406081-1-quic_shuaz@quicinc.com/
>>
>> Changes v2:
>> - Split timeout conversion into a separate patch.
>> - Clarified commit messages and added test case description.
>> - Link to v1
>>    https://lore.kernel.org/all/20251104112601.2670019-1-quic_shuaz@quicinc.com/
>> ---
>>
>>   drivers/bluetooth/hci_qca.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 228a754a9..d66af13ab 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1607,7 +1607,7 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>>          struct qca_data *qca = hu->priv;
>>
>>          wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
>> -                           TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
>> +                           TASK_UNINTERRUPTIBLE, msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>>
>>          clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>   }
>> --
>> 2.34.1
>>
> https://sashiko.dev/#/patchset/20260327082941.1396521-1-shuai.zhang%40oss.qualcomm.com
>
> Comments seem valid to me.


https://lore.kernel.org/all/20260410085202.4128000-1-shuai.zhang@oss.qualcomm.com/

The wait will be woken up once the coredump collection is completed.


Thanks,
Shuai


