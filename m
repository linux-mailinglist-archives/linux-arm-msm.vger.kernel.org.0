Return-Path: <linux-arm-msm+bounces-118130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XD3FCABxUGozzAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:11:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8C373715F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 06:11:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gSyaD+Vk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F+cQjiPV;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118130-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118130-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 630373023E0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 04:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC7E367284;
	Fri, 10 Jul 2026 04:11:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F304A3644D1
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:11:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783656699; cv=none; b=u8RmqSKp+Pys6XBZXKO9Tqz0RbF9PhdDY4XKNLEhzXXVmn1ybvFaBBU7zEcj82U/kHKx/fs0/CGGwOZuRcseIeU0auxE62TXFB6o+RYqH8C6horkvEHr4WQfcvZfI0zZSchwaEt70nEjC0briIl62J10rq+PqZS9e/qBVJXNuu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783656699; c=relaxed/simple;
	bh=LfFIKIOcm55z/amtHtkeCs37XEJtSuSYSN8HZUHOrRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=as/zPHkMikUzz/Mv7uNE2rR2bV8vJn7+tLtxqBygWy6n87hG+GQOmwzpmjMyk2eelnIH5Tuxu8YHKCv34xpuUwYRjhLwTSQ2OqnKfdbXeiNy3pAo52glPDpUlganO2ibuF8QX9popVsjQiynnaI1a0hRzVR2mzdbztABtKGBqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSyaD+Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F+cQjiPV; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n2xs3802143
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKVns+xih/NaHnE7xaZ9w5LtVBrsREGYlKhm+lRa+Ao=; b=gSyaD+VkX2sfDi/T
	5hpsgGIUT25JEfmeh77dPtu+ft2wW6efCMtYviLn3vy2GHIh98iXNn37QE47P2o7
	hBCi4R/IOZSfi0VLkkk8QwDlj6Z4v8JBi7ATTve0uGnKKiDTpjiBTxvcQRR7hLhj
	XUlSHLvcpJGyOtk3WmlKJtxZV8ltBAyApMwzYhHrYRIGX2Bh8/p5czEIuD4VhfXG
	4CdBz6MaJ9PVLFwtnWAOEb25aKzDo+I6SJErXfzY/TPtVgEMdyFhWlwC20bux3uC
	rKGSzQDx9DgpdBB9qU6NSZ3Y2p0TmEPPZd7l/dYx9v6wItbdw8lWWFjw2eCv5LeW
	n66Bew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpk612-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:11:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso4715935ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 21:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783656696; x=1784261496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKVns+xih/NaHnE7xaZ9w5LtVBrsREGYlKhm+lRa+Ao=;
        b=F+cQjiPVZSH1LehALqsOxAAaiANek58OyhD+kj/gbQT6/PZsz9PkiUJpOZCmch71ar
         7d6SdoUGjyd1/3UQMAWvstoRTmRGJweuGPghBqG8LixAkKhK3CAIBybzWa5z4g+VItiM
         a5ylt6i73vmICkL9csfXqo9heuzDHxbDTBLo642xqXH2cULFwPxi9C8JSlOcnruwcmkP
         HkjPTtBjZBGGeemB09k6KOQ1tffQDcHCloMyxC4vQoEz8KK/UQvmyzk3TsT7m5D2mdXZ
         D4aWCmbPUASz7xC2tPkhu789/06Zm9rhnMVQphtWoyPdLws7BpFMwy6sNo0WtoyGfQfJ
         8WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783656696; x=1784261496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKVns+xih/NaHnE7xaZ9w5LtVBrsREGYlKhm+lRa+Ao=;
        b=rPebmfcdgM5ES+Roy1FdZyTMitMx1dL4JOQ9/Zws1WEl6Qqu4s/nRI+5GjrNFyfg3X
         3XL6zCNJIRLRVkQOoj0JXEXxz6RmTnLax/JdnowDEZCz2QJuGMBs2ypJpute/il5We7x
         7FxzOdYPmvwSkFRT6AUejHhKKBQQA2lQgHJ6CUEhjjla7g5LhekBGla7O8ln/tM9BPP4
         ItReqQb7G14p3JjXW0gWXPSpG0ghvrU7zDv061qZWOJpoo1fHnWdJ7+epCnaHY8oWX+/
         24sCo6pJyK6ZMttEXbmQJ/BTraUCYcG2XTmR6/JEFpCrg0XUeNtvuiZGV9FhffNHzq72
         j03g==
X-Forwarded-Encrypted: i=1; AHgh+RoBXcSQSE2F8nm6dAP8ILkIlQ/52XZjS5jV/5cbPsx0Z5SimxErOd2mCbNvS8CVFZfnsKE2acaKwbHOmRbS@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4E65y8m6t59YA2Pqiymt779y28pzjpBxtvcxJxarPD8JvlgF
	DAOLod8xuKs6QQPyimXGr+LN1xGL8x8GOA5Y3uKh13dkbCZ5gNedSFOh/+/j5/bj8IQUu+02wEr
	IwQBlZInlXPdLJHGqqE582WrEsgwVwi16c+JL9Q9YC0YbejBJZg2KGWxXjgRU+rulD11o
X-Gm-Gg: AfdE7cnx0YzOeLTk0G5OJ0p73VAO3bB9XHOufysolP/m7NF4oZE/jR2LANtW9c0mZ+Z
	NpUqaRDxQWliqsQKIHRYiNoBLPFb8feflxtTTs/SnmqOIb3IlixFBrDJuIl1sJINkrO4y1eWOyL
	ycp+Q2hvAYBprJbd3AEfG9yTtKVIV1LG5LZxVCDetMuV6QdRmZE/47a9zlzIAm1SY7MiyJWGFIB
	7KXFYRw4OBtS9v3d/fA5Y79paFakE2PpSnx5bmTA9qTLr9UP2qWj6e/EI02Q9r7d20MnyjbsuKG
	1UfUFfNCsNeRt4IqD5vI4M/FXmw+RYJIK+hcWwZNVtS3r4AhEEG8bve+XakJXI8g9CmUeQ3jS0T
	ypK1Yna8P2X1bTu8mO9TAEdSFxEdBudKZZwgkw7vcnrw=
X-Received: by 2002:a05:6a20:4304:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c0bce1eb1bmr11867071637.3.1783656696003;
        Thu, 09 Jul 2026 21:11:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c0bce1eb1bmr11867023637.3.1783656695407;
        Thu, 09 Jul 2026 21:11:35 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm34378016c88.15.2026.07.09.21.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 21:11:34 -0700 (PDT)
Message-ID: <0e52adba-dff2-4cc3-a13b-758c8d92e60e@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:41:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
To: Mark Brown <broonie@kernel.org>
Cc: Dilip Kota <dkota@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
 <2fe34b3c-11cf-417e-9440-75a5d6e3f4d7@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2fe34b3c-11cf-417e-9440-75a5d6e3f4d7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAzNCBTYWx0ZWRfX+DFVnhA02Ydo
 AetZUnnmcxTbEERQXnHHGjms6HTL/uPrtKkQxihRK9ldN5B44ELN4XjO3LQFrJWbn/DWbb1hcRk
 NKVqjcnNKXUeBoRUdi1QONs2RXi8HatpyC3ynPx8T9DVe4v1Np248pMkVuExv9PRq0w1N0cU058
 5t386b4QN4OCnvA8x6KXVW4eYg14tlqudLfZwWT7Pdz6AAmP+V9B5zAED5jyGhaWAP6RdOZOBuk
 AAsLS/+Ym35vMabK5O30TJ2RwJ7/kPsn5YRqqX2RjXuyNxHvEr5OSu1HO1GqHq5T8EC1S+jSord
 mIzImqCSgcCcTSHRfcYOL0bxlPzTtd7JTMljG5C3IV/7y/DkJ8INXEQ2nFUCavJn6WQJeuEEksu
 zh5pzVO6500HzFb/lqBm9oLNnb+9B8pEWcu/3ij86nTV1xMpXLicjUqEgHjUnM5/i6bSAni+u+0
 jWucetfba1Ndqb5A7Iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAzNCBTYWx0ZWRfX2A2gX3cUAVHR
 kvP2uY6hmtU7UzsSvHLqGn6d5Qr9ueABHUTXvybAFXDEsQN0xA69ccaLVLgQXRGNqbQ2De4uR5W
 IK6K4AySBqI7SyGIBUuCO1mEPmVPj6Q=
X-Proofpoint-GUID: WPnyVyLWd4TCCT1Z9b0sLqP8zZjOUfDC
X-Proofpoint-ORIG-GUID: WPnyVyLWd4TCCT1Z9b0sLqP8zZjOUfDC
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a5070f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=BZ6NEH6zplJ_bYS8KZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100034
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118130-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD8C373715F

Hi Mark,

On 09-07-2026 23:59, Mark Brown wrote:
> On Mon, Jul 06, 2026 at 02:23:10PM +0530, Praveen Talari wrote:
>> spi_geni_init() calls pm_runtime_get_sync() to power up the device
>> before accessing hardware registers, but never checks the return value.
>> @@ -693,10 +698,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
>>   		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
>>   	}
>>   
>> -out_pm:
>> -	pm_runtime_put(mas->dev);
>>   	return ret;
>> -}
>>   
>>   static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
> The above breaks the build due to removing the closing brace for the
> function:
Its my bad. It appears this was inadvertently removed in v3, although 
there were no issues up to v2.

Please let me know if you can add it while picking up this change, or if 
you would prefer that I send a v4 with the update included.

[PATCH v2 2/2] spi: qcom-geni: Fix missing error check on 
pm_runtime_get_sync() - Praveen Talari


Thanks,

Praveen Talari

>
> /build/stage/linux/drivers/spi/spi-geni-qcom.c: In function ‘spi_geni_init’:
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:712:21: error: invalid storage class for function ‘geni_byte_per_fifo_word’
>    712 | static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
>        |                     ^~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:726:13: error: invalid storage class for function ‘geni_spi_handle_tx’
>    726 | static bool geni_spi_handle_tx(struct spi_geni_master *mas)
>        |             ^~~~~~~~~~~~~~~~~~
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:764:13: error: invalid storage class for function ‘geni_spi_handle_rx’
>    764 | static void geni_spi_handle_rx(struct spi_geni_master *mas)
>        |             ^~~~~~~~~~~~~~~~~~
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:808:12: error: invalid storage class for function ‘setup_se_xfer’
>    808 | static int setup_se_xfer(struct spi_transfer *xfer,
>
> and so on.

