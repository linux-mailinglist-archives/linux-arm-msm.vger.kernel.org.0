Return-Path: <linux-arm-msm+bounces-112707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OAuyLJyQKmrvsQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:40:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21F670EA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:40:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FFZH9dgw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KXa9bTUF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112707-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112707-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 189A9324BF3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 10:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C0D3D333C;
	Thu, 11 Jun 2026 10:37:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAE3CB2F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:37:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781174266; cv=none; b=lfCJAoValQkMTwZ9Q5OBNS59W6KvAXOFbD91NIKNGhCaxyxhxHMYXQbwfX5SH62TMSMAA6yKQ6ITyqvbziYY0U/X2opIv00TwLyDMxd3ialzoEJ9iOdKx6zYTdgfEr8Gio9DbSEmeS3ZGMHgarjXF6Jx7Hlmmh8Vn78fxaHQVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781174266; c=relaxed/simple;
	bh=SLxDXjrIL6iecKw2dITuFW5iAt8aytHnHu3Mm9uiiRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QdI6HmtaeAxfk2fpL3d4sggY/EJJ5cFGb7p8AIcjwwW2ti91vtops3rMLKp4vwACfeq79AfG440QrKK1KHVfX5Fhi2Or7arj65NbKfrEtMvWaYwA/9JR6AT9W6G+A4fpeFMjwFQnmUeOXY6NnRhACPY1AvIBwobQASFgrYsHoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFZH9dgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXa9bTUF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9x5FE267496
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=; b=FFZH9dgwWkxTBnGx
	8rLe5O7oimmieFnYnob2ZY1JehYl4EanRI8M/JNn7Z0Ui4IxilRYc3BgGY9EZSao
	wNNOOyjXMdbtvXrIvlFtJbivMgYm4xEZWPDNBv3XnXVr0RkMpw6i/mVPunBlqzKl
	DcvRPqQLOy22KZMmcsDaU5DnYNhfWQIOx2lGziO11Z0XQdd0pO+8H+OHi9t7fuKB
	AIoU0U5tGl9QNicb0Q9O//W2FhjMhkeEjJn8Cy9iCGDOYh4Clrp1IhQ6O/nBanpO
	dSZsku8gyTW7z/SbCEIMBihPjTzb0G47fO7dwDH0SWVuA9Xv+JzJjz4X7OnxKDiY
	DgNvTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u2ynr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 10:37:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so25794721cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 03:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781174263; x=1781779063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=;
        b=KXa9bTUFS+MRx1YNktKFvubSeoEtGypvtvMLel/1VDPmfuVi2V4+khyAYY3aJXbejZ
         NBRUEIuSQvmiHquKXpJIoVm5RpYAPxOMPPwZVXrts8YfjitsDgi6zZXM6+TeeQVCL4DL
         uYD/qYgGn6H9TSf4Vx6DfcnuoWAl6WYWdM6iw+VjMyHG20UwrEjLsipu8tfVNwVi7bYw
         ylsjKXW0Z0QlgQj4dLE1qW9RzVGucyRM6pJ1yM4LLZjkKB7zpAsm3btH/t+qwlcgY0gv
         KwWl/NJG/RmjETb0Ib6mizbEP66meM0R7T4n16DspG28jnwIo+IyJUl85oYv/mIOyzVy
         +XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781174263; x=1781779063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tSbZsTv8JdnJf8FsvcniqLT25i5MlPnJqdxZhssIRI=;
        b=qol6V6ya8oGw6//O9iQGvkP3FwFwkozUQbXL/YD3XkIN8oIK4JrLfQx0htUu4v/Ty6
         PDuLhBeZSPaWUFKqKq7X8iB9so5vglI7uBKIB8YA+ReqXl5FAMjn2uYyXs9vBdtWilT+
         KlGYbcWPoAr1vNv14AWLda42iSGyaf7sL6NDKU/kzsopec4v42Q1f5xSMwxgvkHRumuQ
         aBTIHjERG5bFPGWy5OXy+R4RmzXwJdB2MlLPsPKTCDQy2LuckXOF8T5Qm3qcoltdk2U6
         GdNSiz5oZk275MO6DWzLx09TN456c3VhK0pi5XtCV/6B17j1QML4ITb+b2Px1euiuppi
         Hnmw==
X-Forwarded-Encrypted: i=1; AFNElJ+nOX0etG1+KrUStVWFqoo0d3c6/44rCwMGcBKnVGTPky8NaWdAIz0jZ9+D1jcTOCJ3MmDmnSi0LR+7Y41M@vger.kernel.org
X-Gm-Message-State: AOJu0YwBqsqLCPiPyAB3ZaC2XnGFRr6z05PzkOxj26ThtX4dKGek6o2Z
	cNnVCAJbMzSUIzDaB7ikNritT69G3URKDUjlH1XNzHWHGiw9JUx5URpPaB3221ufcrA0Sl/nKdA
	O4EKHD6spTxUuAPwJimvV9xLFPgaT3+ibI4eogAUfaq8fBuz3X3/rYxv/mCJlac9lJDgd
X-Gm-Gg: Acq92OE8lFdc4qFyKeIPqcWrtX0ekCEDFs1DDLQ18HMTmnpEZSWPFeDz3oTAcxAr8hE
	aXkJwWm0t+3Q1smDrtv5argxDP5XiOXFcL0KsyAJOtNPvyyyiqdfy5yxH6C4xwN25gkgEFEF4bZ
	+TxvYEpNLVU0SKXVWqsYVsmvzYXiW0x+4Rjjwyalrye7zmQwgKOOGTFzfhI9q1Dfgf+9RQKfzmy
	yBttcfO7ZrE3xSCkk687ljtfjuvYBh4LKUVJfGAJ1toiZAexreQkvHEj5OuYXZ1WnpJTA+9k+Xr
	/DIEd00vdnl9o1wtP8bon/Oy0mHxGU1vpNdeFSUkn+wIHromuAm1ijhJ35ySnwLUxB1q55SbInd
	M10PQyQaUtZnKBSiwjlZLg5Sub7NTClJ+T620eKqQ05jvgYdJuASX49X8
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr21156531cf.6.1781174263474;
        Thu, 11 Jun 2026 03:37:43 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr21156111cf.6.1781174262936;
        Thu, 11 Jun 2026 03:37:42 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f14767sm48355366b.5.2026.06.11.03.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 03:37:42 -0700 (PDT)
Message-ID: <2365c393-c6a0-46a7-acbe-72e6d52c9645@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 12:37:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document
 snps,reinit-phy-on-resume
To: Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oliver White <oliverjwhite07@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com>
 <20260605190638.GA4188454-robh@kernel.org>
 <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
 <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAL_JsqJi62TqakY6f+BzmaWx0Cr5m5KZT-GnMeLvNYRDTH-r3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9rxsuOwBHGCZBfMn8ZIvXy-qh0i27CxQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfX7HnzQ7dDFQ6R
 L/hmL6sqztJKyetOCTYG5T3HItf8OSR0b25n2RtdGwHMp/7ACfvUJmtVeYDoGg/P6ooNiN0etE4
 7f3+Y1l/5k8qFV5JuiNZCJ0DWDrDj4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwNiBTYWx0ZWRfXw0OFYVU7+TEP
 4Y1BfTEtUTTXTWI9VeHWJgBaIJbj/lRxhD5CqpeBgqoCKobp5VwplUhGQh+nwfoRFGTr2kYeb+l
 BTprw6/GlT3dfXC+6czLYzK5uUIXJjjV21wb4uMBZlt8un+oCGcdMARMdtlYEZhaD7thwEqOAtB
 3jN8J9JmHNozCzwLz6BuvDoAE4M9vs9r5yV88eQAn5XUKnnVHYJwwDRnaFIV4XVzRCJu+ZXLR0Q
 +6nw4sWK/kHXjxLekgxslCtAPWXaB4Rk+s4oh7IjaFZn0iFEUTsl7Dm1a79zlA0H08wzYo43Vjz
 mbhvKlGg8skET9NLB9TAMFqBzjw0i/Ek7SysfhhvwMHSskStvZfokreN5c6C8/jqr9l4wzYjmjQ
 Zw/g10yfuvbZ7xLoOMntLiYCcCMfKVEM27s+1TSiAJvRmG8lnHdIFEc0OrLbnTIQ1qDwE8zYvWR
 s/UZnu4Kd3yRsDdJnHQ==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a8ff8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Adm4HkoqiFglUZcFbxYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9rxsuOwBHGCZBfMn8ZIvXy-qh0i27CxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110106
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-112707-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:oliverjwhite07@gmail.com,m:gregkh@linuxfoundation.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Thinh.Nguyen@synopsys.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:balbi@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,synopsys.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D21F670EA7

On 6/9/26 12:00 AM, Rob Herring wrote:
> On Sat, Jun 6, 2026 at 6:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Fri, Jun 05, 2026 at 02:06:38PM -0500, Rob Herring wrote:
>>> On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
>>>> Add the documentation for the 'snps,reinit-phy-on-resume' boolean
>>>> property. When set, the DWC3 core will perform a full phy_exit() +
>>>> phy_init() cycle on each USB2 PHY during the host-mode fast resume
>>>> path. This is needed on platforms where the USB2 PHY power domain
>>>> is gated during deep sleep even when device_may_wakeup is true.
>>>>
>>>> Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> index 6c0b8b653824..d12f6ae81ab8 100644
>>>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>>>> @@ -212,6 +212,16 @@ properties:
>>>>        When set, run the SOF/ITP counter based on ref_clk.
>>>>      type: boolean
>>>>
>>>> +  snps,reinit-phy-on-resume:
>>>> +    description:
>>>> +      When set, the DWC3 will re-initialize the USB2 PHYs during the
>>>> +      host-mode fast resume path (device_may_wakeup). Some platforms
>>>> +      cut PHY power during deep sleep even when USB wake is enabled,
>>>> +      and the standard PHY runtime PM resume is insufficient to restore
>>>> +      the PHY register state. This quirk forces a full phy_exit() +
>>>> +      phy_init() cycle on each USB2 PHY.
>>>> +    type: boolean
>>>
>>> This should be implied from a platform specific compatible string.
>>
>> Platform as in the "root node compatible"?
> 
> No, the SoC specific one in the node you are trying to add this property to.

Taking a step back, wouldn't this point to an issue in the PHY driver
itself?

Konrad

