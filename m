Return-Path: <linux-arm-msm+bounces-114478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oEhCINLvPGqpuggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:07:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8796C4138
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VHSS0zPK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kQe1gdga;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114478-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114478-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52F07304B69F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812F835AC00;
	Thu, 25 Jun 2026 09:06:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FDE382F1C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:06:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378399; cv=none; b=ZRwdwg0je1TztH+zhWJ5ycUPqvQDzAa6A6gYB0hMPx6olF/7YNapv84AKm8EhVUGpjjREz4uFriRjD5RClkv2sQRA3/PHUx//mtQriLLYkXscneIbTo8d0vhZmptuskvzXkTTBDF50XmZhpoVdH+IE/5XPPNHp/7nLS7EAsQThk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378399; c=relaxed/simple;
	bh=pp9eaPjv9rnptr1WI20Uc/j6CcRHM7bBBfaRB0Z2w1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbxfUPBJzTq2CPOrD3dK5ugwxUWPrFU1W0jj+UcHTH6kPPu9vr1we+HyQBl938ItEWV1fQEmo3epDiVXXwHdPvsMq1zZA4/uqAyR5ZHZkekrG0llh1YIClbhV7yDaPH2ds+cVfCHbMj1fkGWxvLuQUsaMrJ7eoJQLbxGKXGcM7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHSS0zPK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQe1gdga; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pSaD1331870
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=; b=VHSS0zPKAZ5zHAO7
	ZIgPyJNV9RROWn6xI9xkYojFGHCr+CYAvDwq3DwDbnE6mzB4K3fnJpdJsjPx30f5
	Mm7ne3afzR3iq3QzfVgc9LuZ6nAIqmGUTIM1NYlJ6lznQmy2SvAIx1KgLG1Pi2HR
	5cwj8dUH/l6z4FpBTCqrha/Q3eTTOQDkR1lF9gENtaQZryP09B/+5l5+kc3SsNnX
	GMIR1xlV7rD51ARgKtGnNfLYwYo0AEnG8dh+/Q8feKVEQFcnKhHgTb7P8wePJxUZ
	BhQQBQ16qH5bwsxFOWefyKZv5ofFN8waXO9m1hVTfFD0s66KFG8IPCoDSH6sfzww
	xG0BPg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbtvpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:06:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842446a3851so1383535b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378397; x=1782983197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=;
        b=kQe1gdgasnbaQoLnVtkghTEzpH4kW3MmEqS3KDd9FKqaotM+OF01Qbu7JkCL1N2oUb
         YobTfJ4d7pvkV6qaSH76/bxa5AcaeiQd/nnNS3l7Sq4EzNIKH4RIUMf3uQUdzb2ISgvo
         R4fzyvCzAdLo39DlUIjRlx+xUtUHeP0eZbelbRnx3iC5N7WjTVYjmi7Gw4g3x5Y4ycpL
         4Am/tTCPKYmaxsu4UbUhI3phetcNsHNDsVeXR0rM6tvuAS/BeicCbkIEbPuCX083qKEH
         RAqbLsGOhcFkyuU8EJlS0TmWNiDHXNDqwfobZ9kzMh6mQC16yJF0qdg2UMC1QlZqFng8
         GhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378397; x=1782983197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoIbfyB4RGrkSHBFMdH6jDJeDEis0v3MRca0wSXz5S4=;
        b=iEpkkTWf92hdg4mljfxJedTr7k9JeTZkRQzXGvgLghjh6eesmfthG732gjsbBI8ukf
         HL/3V12tSZqiacn8+k02PtBdzr8S6GBiEy9RvzVSSIj0gdYSNKi3O1CKd8IiJRni5Lur
         Clzdc//5r1328mRmS+uEFZYfiDQUTlweUAeoQXuGyqk16iPtZh2upsULsCBrLhlqhk4d
         frmWeGkWESKMHQQ7C8mAzppdYMmjt/3EBVIe8hoVoQFpz/gr4gfJ7keie0m/sYn6/3hQ
         czdwKeL2um2XvoewKuWb0U0z3V7nua+4jTTmjUiWOuj2xUaWm9xpPr729/wI/9QYvqAQ
         Zapw==
X-Forwarded-Encrypted: i=1; AHgh+RrP02k3EuLtGJZ9M6DlibeUI9CwfPB0UIOZgJEOn0vo4ziDDWr7WOz54LyR2ZF0fOt3H7H/2GFNcvxcq4pt@vger.kernel.org
X-Gm-Message-State: AOJu0YzPBUrrMixZhQezd6jfOR9BCeBm7ab3KMn1VnnJLT+XWn/laWRW
	ID3RmjC2llAhI4ODJ4syH/Evd6l3DkCWRpxrAPJnGSmRBeKGeV+OJH0Wg3cHHOr4tL8DnZY+jdz
	QCx4d0T2SuBBpVnjQob0TRYxUMuP6XgAcjv6/qeKkqrE1xrcNoJrNkaEfiP90iakLbONg
X-Gm-Gg: AfdE7cllEgU7VWmonDbVicLMJjFRiBwma+QzwiAzsg1lhnm8ikqWUD0rChTsgapmSEf
	Y9bFBa4LiLyIQj/6StVAilEgxZG4oNXhBPusv3xJ6jUdc3iqcfhOmwVA78mLx3a90pyfBZ1Nvwv
	bCHEKVAW/8uNrO4J/Q6RYv6N6BfjM2dHczJQadJUEZNqnkfn17Bo/VSe+nwWCqG5uayOtJidBP3
	rZMyZ16rPPzLHk9FMAn7ccbXz3Nb/RFhivgLcZrG1NYK6bH7JmTa9oXh5Y9VT+mhYszcsuBZyuh
	9Y/8RwRzPyC7B1zCnpWi/UgnOl8RsrVWdonoVtc/Zsp4x0lDl1PT0JLx9lYzAE4pNV7kmSZtHDj
	1yd+6OCTXjk5C+4DJhElIqbbUxvN7zXSrmp6R9/IytBjs
X-Received: by 2002:a05:6a00:3d16:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-845b3a0f664mr2237384b3a.20.1782378396577;
        Thu, 25 Jun 2026 02:06:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d16:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-845b3a0f664mr2237335b3a.20.1782378396074;
        Thu, 25 Jun 2026 02:06:36 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d1b0fsm4240804b3a.28.2026.06.25.02.06.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:06:35 -0700 (PDT)
Message-ID: <14491fd8-f785-4404-878b-5764bb8fd593@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:36:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com>
 <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <CAH2e8h5Swn2mWoz+t_nrSw1=hQttwi1Hx=dg=cd9S3QRnHjpSQ@mail.gmail.com>
 <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <3451facc-4a2e-43bf-ba13-944488bce437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfX5y54trtUUoXg
 mljjUCKKOzZBxbu+rAseTI6hTZJebKTw86DYLlp0RBcBECRPNf/b2BogHFa2QOv6rlGb2Uy8MSb
 waRh+GiS2/bqyaro2f92P5TShMjeuS0=
X-Proofpoint-ORIG-GUID: R2kAEdpzIeYAdItKHCYPdxqeqoXEcXzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfX1wHWHU8L9VXz
 2DSIU8+DEgHY3J+aCVusGLJc4Blx4+/upWxTmqkoa2XridrhHiXhhyFX5c4AYe2tCtFVSFO8/74
 fXuk4qb/tgv4hgn3423L+UF8SmELh/jasj3hfWINfQXt18bwsOZGPbw8NaewKZRSFUEV0z0rFUL
 rTlwxn21UqmX3HoClSu8++SUv3D7+e85sxliXPp3QLhY+i489NgmHen6FIqCWb0B08FQmFXK4J1
 tM3InTjuGyEfLv19J9xbAFb2EI8vYNoP6QDW+FIl9bra+MCQnXvU31+qi9TK04MDI0psU6qEjVB
 UgzJqevyd0un9IO05ocyET4uK3TZ5k6X+9+HribrLeq4VemIEyUjzFU1UNbPBc5wW3xjWQrIDS2
 ji9NK9tDWZdIFJpfVw0QMYiRRzGakVlDNFssMEEd7DK2lt4CJpwrd+uCnUxEHYniLtiFroXz3vb
 aeVxZFw94pMXI5xR03g==
X-Proofpoint-GUID: R2kAEdpzIeYAdItKHCYPdxqeqoXEcXzt
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3cef9d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hIrod8inOkKnRalxuPoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114478-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C8796C4138

Hi Konrad, sorry for late response.

On 6/15/2026 5:12 PM, Konrad Dybcio wrote:
> On 6/15/26 6:25 AM, Pengyu Luo wrote:
>> On Mon, Jun 15, 2026 at 5:18 AM Dmitry Baryshkov
>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>
>>> On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
>>>> Some devices (such as gaokun3) do not disable FIFO mode, causing the
>>>> driver to fallback to FIFO mode by default. However, these platforms
>>>> also support GSI mode, which is highly preferred for certain
>>>> peripherals like SPI touchscreens to improve performance.
>>>>
>>>> Introduce the "qcom,force-gsi-mode" device property to hint and force
>>>> the controller into GSI mode during initialization.
>>>
>>> Ideally, this should be decided by the SPI controller based on the
>>> requirements. Another option would be to prefer GSI for all transfers if
>>> it is available, ignoring the FIFO even if it is not disabled.
>>>
>>
>> I have read reviews. Can we check if the compatible
>> "qcom,sm6350-gpi-dma" is in DT? If the gpi dma controller is
>> presented, then we enable GSI mode.
> 
> 
> This hunk is very odd:
> 
> /*
>   * in case of failure to get gpi dma channel, we can still do the
>   * FIFO mode, so fallthrough
>   */
> dev_warn(mas->dev, "FIFO mode disabled, but couldn't get DMA, fall back to FIFO mode\n");
> 
> In my understanding, GSI DMA mode is always preferable. +Mukesh, do
> you have any insights?
> 
GSI mode is preferable but if for some reason it fails, we try to 
continue with the FIFO mode. Just fallback mechanism.
> Konrad


