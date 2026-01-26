Return-Path: <linux-arm-msm+bounces-90607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLmpJcapd2kZkAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:52:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94618BBC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 18:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04BDF3007A51
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jan 2026 17:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F7D34CFC7;
	Mon, 26 Jan 2026 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEtuQKM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YidvFfRQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCE7344D8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449889; cv=none; b=UVOnNP5/1aZIwcGl1a3JaZazLb6Ws58quy3odwasmMCa8xbzzkqOS5lTPm6Crv+wIHQ7LTOAwC2aTO0/aakaatvVLiMnWiLFvB/6vnU4krfrDqu4rM+0wXQ6v8xTKXsK1cDIfkq9VboCSM3GJ1/asrRPyqKJO0e3MQOn2ncyjOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449889; c=relaxed/simple;
	bh=sfqtl8D5xrQwgPJwYKBJ/0KVH5pLAReiRdToQe8LN9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWhY1BjQb5V/9RMJVfHEEZKtq4YuGaSx0h/Hy6aYpfIP6sy26wVAncEbRYYvIJLQ0UginiJcdJ6NUyAireV+XQBYxgih5wq1vUom8z5KOBlEf27XAHaiJqpeA4gdJZKvIhsGevuM4uCRg6N+b21FGhC6z/H9vEwLTXwndTqppBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEtuQKM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YidvFfRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8AlDr3570819
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rLTjF8XCejQy6c+mku4HCCaH
	acMMJvRoqeKvF7cseFs=; b=gEtuQKM5EjTN8RtRN7CohRurRdeETLCERWUreVYr
	QPLwx4+8bOsDVYMjSnwl8jpZUO3G5x/J0UforIRcupQTRzJrTAtqOUsoH9nGspx6
	Hj7t/se0B/rVEsYDd4hhxazhUx8jSVv4HuE+ry0pTa5WnHdzvcgR9MdkS9OVP6q2
	92z9BRVRIrLm5+4FL/C82FKzmJFUKyHFwZglnuw1RvOugvWfYIGavcoVsTKYIdqU
	AX9H/3j8+dS1wU7UkpAXcQcoEXE+xW2qTlUSvpd4vpxZLoIB6SmYYi1pbGZaxYr+
	KiyLFtmyBbzj/X2mAIf7UGboA1KJlJ60zyGlVUOxqrMHQQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24nbtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 17:51:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56626b89e83so5160318e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769449887; x=1770054687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLTjF8XCejQy6c+mku4HCCaHacMMJvRoqeKvF7cseFs=;
        b=YidvFfRQwTHS1g/BKpIsrM71KEIV7O9Xn6ORJ74EzQFbOZwk+ZT5XzILflv4AHRByI
         nFpLis7dlh/73+MS1iKOt+QuRjpfd6QHdGgZx+Kxj18ZFJ+7+3bqSqq2WV6dkTxQTN5p
         TghjrIjpwi/fKn9SRM9m0spXXW1DfqSI7yoSF2xxbceMQJBgh/FQTdiqgVy8e//lXj4e
         CYG8ngS2EVrH7/6p6rSlFoBAdIQsPySApTNQy8276frifBOGhWCW+i4P9tK/Rk+IXUti
         uAc24fwBh6sZDssw37PGBcxwU57qSIpD3wT44ByPJuMqH1JQGUBFKdSZPi7eqelMGuTg
         esew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449887; x=1770054687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLTjF8XCejQy6c+mku4HCCaHacMMJvRoqeKvF7cseFs=;
        b=eWVcTR90LOtorTWviCUpQFRhrNj4XXdD+RopD4J2qVK7KI3MyboBANtZDvT+dCXjNi
         nsy1KCaYGdKrl+cvvW72RIGMIrn5GXseQtOdN6pzSV5ijCYlCHKQdtWGVzS8PLqQlZZp
         xw2prX1phVyhU1qFIjS/aarEw9ijtMWvnQYiwUKBOxrW6FU172626WmAfjOHu+aK+BD+
         m+fQ4D3M8i5oF53In4mrjI9vPIvJIZKG1v+cFfFDqroU0FpKwWVFDjo6OYU+RtsxiSCz
         rLvCAZ2+SInBrvwfIYE0Z7vMvRpub48onD4dwgAqMmRM9Bo57Kgy+ckbfwPDXm/8eRDF
         mpgw==
X-Forwarded-Encrypted: i=1; AJvYcCU8FoP9h6j/HN0+q9C2ZJLI8BDzVp0dImF8owJvUXz4qrgqvozNCwXCyhsE51MJY4DUNP8H1eoy24avxTke@vger.kernel.org
X-Gm-Message-State: AOJu0YxeWPK5UycuyyB4uwzL5OAtG8T4pQ+BHBzZB3nWZcKP0NbcpMgv
	6wRO0BGl4e0iWJMN2pTzVNeojWqOdbo5xje7dqMOvlPRa2i2pFBGlK7RV+nnSvSYJzlBqR5Hibe
	qaSd3hIjJxKD2Qwf1s9+oSaRz1JojixsucCmMegMe76m6S6pNSseqSxSowsIq0VOE1Ei2
X-Gm-Gg: AZuq6aLFAxVjmdXjtES0zncM6i/WR46U8NYgXmrpMdFnCQP6Gdy+agdUj94XzQxF65H
	gwrcBl850HLibL1tvaoKY271js7Ow3EIMJOBqE6OrOJXi7bFQfuc0Tg+o9Ls9ZWf6SDWJpEHQJo
	97SRf1m/LfpJdNqqn5JP4zFDSaydpdXOFiJLvJuLAjJNcwsi6rchPRtMeXmb0W5ntsBpz2ETg2G
	MB6JUEmYZS34wKt54kFZ2lKOl8NZ56EY5bOtW2izqNL2qlSnzIFV2DhQghl7+cRswl8RWlopccg
	f3gkPxwQMBAnfJH1MfnScszVTUX8DAHx/8gFl0S9Lbf+XcegTTL6VBwjRRK8On/vsu65FDLMmGW
	Uj4u3NJMVM+Ol/JjHXOxjN4WJw3mfBLWP2nHwEuJ4AGZtTWIALmM2x4XvZ8W1YOMWlXQ6YVOZ7E
	WsoQqNWaH3KhgJLOvKnxpQoOc=
X-Received: by 2002:a05:6102:511e:b0:5f5:4d65:9b05 with SMTP id ada2fe7eead31-5f5762cbf44mr1305303137.4.1769449886490;
        Mon, 26 Jan 2026 09:51:26 -0800 (PST)
X-Received: by 2002:a05:6102:511e:b0:5f5:4d65:9b05 with SMTP id ada2fe7eead31-5f5762cbf44mr1305296137.4.1769449885947;
        Mon, 26 Jan 2026 09:51:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48df61asm2844187e87.12.2026.01.26.09.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:51:25 -0800 (PST)
Date: Mon, 26 Jan 2026 19:51:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, shuai.zhang@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, chezhou@qti.qualcomm.com,
        wei.deng@oss.qualcomm.com, yiboz@qti.qualcomm.com
Subject: Re: [PATCH v2 2/2] Bluetooth: hci_qca: Enable HFP hardware offload
 for WCN6855
Message-ID: <kej5u2hjxjtfdzmgtebns3amz7gmb5d2nciy45jsyglkprgh6s@kt6fodrc3oll>
References: <20260126162444.4194293-1-mengshi.wu@oss.qualcomm.com>
 <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126162444.4194293-3-mengshi.wu@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE1MiBTYWx0ZWRfXwu/hK8DcQEmo
 1rqvZSGI/rttUDsLnSNw/9U1qNDS4X7wgXNVbHmBdZIlKShlbd3T7EoXLD/78RqMaCj13SWILcz
 Rh0RtSrQi+rMJKxWSC/ZoXikkyGAbgjhvSgQPi3Hf/KwIoekgdUJvU0VGon5uXtl9fGcKpoIFtE
 adk1SGVb7lTs04H4fUMrD5ayrXu8buKznFLyxl4JBURTCu4T04WAUNsa1P/UoyzSrP+8nQHI+MP
 rLWW3hM1422dhAr1v20jymbXg377TJLRFWVun1NCwsSbGHL8eYdEXhlxc/jH9BHx6q4HFU/Zz0q
 mQfwwgGr2yvx87ax1dPylxsNTIqxoiLn9VA1TGkDvpugEiJjyfVgKeNW72mE7txy10op5GkGiTr
 vPMYHN2Z4uln7kjD5aSEt1HojIy3hdVYFHTi4FzqfQtlPuru+klAK25zFAndBATZTsd3oWMwYLr
 wW6Iz2k01sAVu1mB7PQ==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=6977a99f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KNAojhBsoh0SNi9vREEA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 3HHRnpgzf2CwcHOmFUbGhrx-_6gR-UWo
X-Proofpoint-ORIG-GUID: 3HHRnpgzf2CwcHOmFUbGhrx-_6gR-UWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260152
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90607-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B94618BBC4
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 12:24:44AM +0800, Mengshi Wu wrote:
> Add QCA_CAP_HFP_HW_OFFLOAD capability flag to WCN6855 device
> data structures to enable Hands-Free Profile (HFP) hardware
> offload support on these Qualcomm Bluetooth chipsets.
> 
> Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Any other chips which would benefit from this flag? If you are setting
it for WCN6855, I'd assume that it also applies to WCN7850. Should it be
set for WCN6750?

-- 
With best wishes
Dmitry

