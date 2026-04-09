Return-Path: <linux-arm-msm+bounces-102545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKEzArMK2Gm5WggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:23:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEAD3CF75B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32851301DC22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96BF33DEFC;
	Thu,  9 Apr 2026 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVMVhu6M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJ8riW3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FF52DEA90
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775766186; cv=none; b=ASWUl7dHPQQsxfOBSgqCDzW6bfREKL/l7U+T4ake/v61k9fLuhyBoGj8XU+cPEsSOO1viP1XzdDU2mwjrIbudzx2+f3sj5Koz9qJek4N4asr9SRjTiOKUn11fuGP244EL2UV4neBBG8PmBxD36jd000vPl2/ZklE8h0L9leBG3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775766186; c=relaxed/simple;
	bh=yBJ/NxVaCYwQ0igYQAFkgqv2zp6NSa5HyfEfoQwiFGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CCCpHl2iUDn1vokNYc6emK4RjTJAbYH54yR5+38yTvwrBfnq3P4MEY/aWfJFxLdDuxpXZVTIY8p/aVpCp3a+o5/C3mOLBHKv7+f6WXOubF9NIy+0ANmHKThrD60XdLIZUo2foblP3oP1gKgYz+SW6qxAnZRNLMHfE70V5/Oia44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVMVhu6M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJ8riW3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1sLG2624720
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=; b=SVMVhu6MyGcYZmHE
	B5pO1E/XFaKr6Dz9LBq4FW5XRQOCd4wPVNxtuhjXDYrD71Z1k0AcvzgmbDv0I/Rq
	5eSj04rDG58BVbn57k8aY0URYm0Ni7SS5nDX+WONNvBQJDuUcEg9x+lcWB7YSxbo
	vJKOjlaa+o5daZamgV1LNdush0ZK72uVmvBwWWbeC2XOpC1dpJG/JPOAD5/7FCSO
	ut24fZ8n2TlM27z4+rqedyhAd6KR8FN/0pDaTOod3ZApu1oniXiaYUMS+3K/yHzi
	0he3Hq9q5bzEIDRqv7ezGIJl5p3Splt+2qdc65QBE6Txp2+2wQo3hvzcZaKR4Nex
	sgxjLg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu1jmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:23:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso1526489eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775766183; x=1776370983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=;
        b=hJ8riW3Q+TI2hmFMhW8fCaGar5qmeAo1w4KIzJ1mBpwzzWIbqOeTh8DCzjsqD+lO+5
         2NyuD7tc3zDqhEpHj56VMj/4VJsNRXs0dSghA7H9nSF5ait8BaxOpPsnwOio6MYQUGX1
         qmCC+zSa+Mx8alkSaMtPNSgO0hpvPYV4GMhNdS0uzSXtEBv7fN1xdDXhpV8k5J4ZvzSl
         l4eo8Poufho9DzVq03O8GIf99ZFFE6PTpVBEgoba8Y1Nk7bcgtdQ/x8dzS6oyN79G22O
         ah3TnASOPpIvzSzxBdd6lEqKzWSGwwS5ydyfJ9gKKtGeJn6leLFAQPDwnsx8lQHH7MlE
         /+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775766183; x=1776370983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yAm1FyXVAl2rw2SiWlWKegNh5tcyNAIhWj+e+79Lzlo=;
        b=EeDxs/PLRMUT64bb+edpy/4qXuc5u4BAD993jrSLtpOXRUqg+CC7iAAd4VVt6YqkH7
         Ul3wvAivTuaJycZQqlYq8gHNEgQA9I4MdeyJsrhMg3zpo52wzgY5ngfaqRFjnYUc5sT/
         5LqiNh4LXFuxDOztZaroFzDSFDBN94IRSUwiqEqy1yDq2WA7LQ8zGz4JnrckzH1pfgjD
         uvu7zyqkOOTnfBJzadOKm3gjhH494xxaDJ0MZLjLVzQlPj3Xukb4l+hvQImB76XI6tog
         LXRoBuzleSkZ2s2Wi5azUGHRa/s39X9A2MxDMtYti4WmylwwtdF4NAyNO4FEWR3+GKyn
         KeZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUngPXzrms3den8d/7G+cRKeDve68hT8YE4a0jlEXsLOwwOAE6qqwy+75gPeTwPnAmV0w4nWXaEBQCbnoLk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1zYS9sBazUX3Q6g45f9ZYhRyCStLw4hwEUF98DG4LjI/qMLs
	Gt2ktrfWRbiRRHeeo4R0P6QGf9iVUjjDdNx0iPvY9f3MyCOPBOOyLlca58+2Yz3jjPmMFKXoIUL
	JZ311FntVUldpRJEM2A1N8oCDfIL2+226ALIZnmhYEpmIzxrDHhkOv4r1BLgzXLiuNucP
X-Gm-Gg: AeBDievEYQapS/wqEoc0HELt6+jZRV9/z6j/qo74hVxHlv3svmfbdJ7E2yTYHsPxZM+
	o+zjy+Jqw/buAKxIQnLYoT5q0OhVki/F/RhRuvUQsCzdfyhVrQA3/Mw5rzHumtcN8sCHVdR5HIE
	9lF6HSZKT5weFEE915acm+eIOm+bWZPiZKaum+rPg14L9potbzDoSksm9RNkUEr3nQ7OZkeFZBI
	V4D2lmOlsz3WcV8LEtmmBekLOr7qxiJqgwTPEG4QCE7qHSZxzzsxA8i7mJjoCNPBXQ+aAZ/J67C
	fR2S0927z5u/n9O4joOmLzLIHBuUQFOj7V7zgG+PBWQ8dLr1DYLjc6LH6Xl43RqRTFfLlrlSCSz
	LqkoKyunJxXRTPoueCx6dEujJZQVr66cI7ch1BNFdxhX54tCs/90KbiGajej4L/sLRGSHlX14Gh
	A=
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id 5a478bee46e88-2d5897690bbmr312304eec.22.1775766183122;
        Thu, 09 Apr 2026 13:23:03 -0700 (PDT)
X-Received: by 2002:a05:7300:bc8a:b0:2c6:cdb3:bd67 with SMTP id 5a478bee46e88-2d5897690bbmr312275eec.22.1775766182573;
        Thu, 09 Apr 2026 13:23:02 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562ac344csm1137899eec.25.2026.04.09.13.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:23:02 -0700 (PDT)
Message-ID: <7aeeed43-b458-4c68-98b0-e857f1ed791d@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:23:00 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] bus: mhi: Match devices exposing the protocol on
 the SAHARA channel
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-3-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bmXIa62C6ke5uCb3sO0JHpnmWxAqPVHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE4NyBTYWx0ZWRfX09LukXokGjJ+
 dyz1WqLCPtC0KXg6RRwRXo9cFL+zp0hr+F2y6lBHN/MGEZChaX+t0HcqaugqP09YEdppLIy1mcy
 wxeXecUpzj200eAnykowmGGPYwyRB1MGg1FE+z6BbqLRyuiFvCC7lRYPHSYx+QI981/TSZCl/Ip
 EejzjjW+BU+YSupb8AnIx3HbJEy/vlmnuMRq/XCVwnrhr/lyC87+t/nZg2m7g+3KS+gTXdaNlMd
 DOuDOy0WLMnFSnM/fc1NziCDl3h0sk3EAui73v39pFBhLK3qaEk6wVTvmWI/C7bW00/s8/QE0CC
 oZfK9rvIVvByZ8g/6LYP9+CeOKo5GD9mRqkvXU/lYNbNPFUTnPRAvqJto+H5Dl9cJZ/1TKlvnxS
 GXFzB+uMXorLfKCeDglXF1eh+T/kdXpnZb6Wuz+ELi3wxo9vI1D27UH8OL47dQuII5BPdrsYnPF
 C1ZAIRWxOlkl4sNkYXw==
X-Proofpoint-ORIG-GUID: bmXIa62C6ke5uCb3sO0JHpnmWxAqPVHp
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d80aa8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=3E-APKfXKu7q0kj6aHwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090187
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102545-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6BEAD3CF75B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> Some Qualcomm devices expose the Sahara protocol on a generic SAHARA MHI
> channel rather than a QAIC specific channel name. As a result, the sahara

"Sahara"

> driver does not currently bind to such devices and never probes.
> 
> Extend the MHI device ID match table to also match the SAHARA channel
> name. This allows the Sahara protocol driver to bind to devices that
> expose the protocol directly on a standard sahara MHI channel.

"Sahara"

> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 8ff7b6425ac5423ef8f32117151dca10397686a8..e3499977e7c6b53bc624a8eb00d0636f2ea63307 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -911,8 +911,10 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>   
>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>   	{ .chan = "QAIC_SAHARA", },
> +	{ .chan = "SAHARA"},

This doesn't work and breaks bisect. At this point Sahara will bind to 
QDU100, ath12k, or something else but not know how to drive one of those 
devices.

Just add this when you add QDU100 support, which looks to be patch 5.

>   	{},
>   };
> +MODULE_DEVICE_TABLE(mhi, sahara_mhi_match_table);
>   
>   static struct mhi_driver sahara_mhi_driver = {
>   	.id_table = sahara_mhi_match_table,
> 


