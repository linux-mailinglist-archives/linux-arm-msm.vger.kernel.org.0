Return-Path: <linux-arm-msm+bounces-115673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IaY3CKL0RGrw3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A19396EC8BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:06:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ElGUKYke;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NJ86M/Py";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115673-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115673-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83298307324F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF24D43635E;
	Wed,  1 Jul 2026 11:02:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1CE21B191
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:02:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903722; cv=none; b=D2d8eQzo+KH72iNc9FvFK1JBD4PhA9JVgnuwjBlSQlbgCBVR8ylZfN/bkY9vYX7IGNpW7DzBxUTcO/tdCNEmkYKK3JLPg15A9C48KMaraMO2l0AtZsMgAJYNtdqpD/1VS+Q5ua5KOYsylDIbVrvmx/b2NMZCDBYdDE78cM4zSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903722; c=relaxed/simple;
	bh=Br8s1Od3JEOL8qZORdm4eG395Bw56pWcnLaBfgp/wGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FnrTbtXMjKmo3HCDCb7MWxV/6Zib/5wKuOQ13gSaezkXXhXTcDXrBwGBLyhlXdsNpdeVG+4cmcyCgN9CEpTEUR9o2sU8bOLcx6dLDS+/n9QmAbRk11xbrogKdttNktnI8EMTiv1i5ew7VaGi39rTOTk3dGBG9zUh4IGD/uoIMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElGUKYke; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJ86M/Py; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8UJv680776
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=; b=ElGUKYkeMmxIkgOz
	thIHzWjBi816QcqEqbreeIRMyIZU+6rVG+rebZE9G66w0v2luGay9FWAi2p11+1b
	WamPKZU6YNqu7ehEZvQLIGFOubMPljNHBV6TpY9kaACuypXi8Tws1YrI7JRqy8fv
	/6poc5jXITgCRmlN4UxleWMjee9AhxwgIFQia+bLF2p52rMPRZzlNMD0jtzleArO
	QPMnxD96dfuxWEZRWaUJJKBAiWutTS2hZg4RH8cER7WZY+ny5Mh/FPfQU0YASFbQ
	QLPI+AisWhheOktOthSyv7cWpKLU0IzeZfN9AUvYqC1zqfwKOtZAN14rBvDkutKP
	bTNfPA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3skt53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:02:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7386e55c63cso16334137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903720; x=1783508520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=;
        b=NJ86M/PywGH353GBtBowoRzMKI3udNfy2UyMYJveHrxx4CX3JO7HVCAXZtsc/SyWQT
         wY5h4ODE1vUunQoPy73EEw6PC+P700Aq5zvMLBTar3/HwheXr/fp2cZJkQPa6V7/NyXK
         SDVuoEELaXP3AxHg4InRmMl08Bd1luMdZYyr1DYJwUzISYF/hqVEVAdluOn14113CHso
         U68aJtQ+rWieoVbTRUpHaWGp7gvJ1//4+9uPVa5fiuKEfrbgdcr6EyQKlgtGI95ftUdu
         10Z3cWAz5qgSZhASLXsP7EQef4kmz2aiaud9QuSJwW6mW1G+WcbpUF7JIkwCBgYgaBMM
         c6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903720; x=1783508520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VxGUWVh7XlY2oaLv4zshgCYnYU/gzVpwiXufl467KvU=;
        b=VWrtlNgQs1sT8uzL7QC/tUYFzgD1qfmgCgZywIzZSjXA40qjXMLVL3SrGx9uQRmx1x
         kEto0/YAcns4E8x7qDg35EpO/2W4XWmWzjuy5MFoC3WBdq9+9YhFNmRYCw/00cxhyJP8
         oN44JGKQ0EeyPgPtjge/QjlDVlOFp9vzYDbAKKGu88gs61oYQujWTgtkfvRcflHgfUHi
         m2o9uGxjI/qkw2t8XskPWhSl7APpX7Sxq5n2dkIPN25u76lr4openRW8Jhgd21q/DC/I
         z3OCC61U7Sra9IUlhQKUWdD26LjRLZrgva5gfg+mNDqCtIuFRTnOvz2uo8OpkWHgOHeU
         +xPw==
X-Forwarded-Encrypted: i=1; AHgh+RqU4hVGuJS2rxBwnbhOW2cEIoRN70UMG58h7DYa+Tq+LYZp9VnqB2LNPk1BuMHufLywfcqQATsvY8+UOtio@vger.kernel.org
X-Gm-Message-State: AOJu0YydyW9DT2RkxbZl0lNEXuHpHhtwbxDw8Nk1Vso4ri+dHvQFeHZp
	qYRz5VQX+DCAFz9aG1HTnZSfRxo0sN4HSWNWY8eQPgIOUAFRtVA1IRsbfh4cK6hbPkJfFoOyxbN
	TK1nl6crcruuO2w+oGV/wGdZdRGYWKc+TazTv5GPpXAlIUfcMsQbZGSUqewC1DkESgXkR
X-Gm-Gg: AfdE7ckEAVGZ0ATdQSDh5MhNj4I3wZV4JRt1NRNeszFT1lw2jOv0PNq++3R+G2LnONX
	sTpWyvUA2yZ2t9b9Gu2spsOeaLO8Wc+nXq2V2bAVbFpA0BeVA3rTdnVNRnl9rqqvTS59rVFcKID
	/fjIKlgk5GSV/knKx/HSEZOQiqOZIiFW8E2F5JHnhVj90f2Jj7RIz3eEoQhvZvENOiD2j1kO5yl
	nBPVJSYZbRyTXAbpjib8c2gnyzIl+58zVbS/aFfjAVubv47zo53C4vUPp36uyWIim0vUZ8SOFhI
	sEJ63Fliz4wEe5cOTHOvxJeptBgdspQ22/a6qk52VyAW087qTEJkm0FTfS1wFvf9p0y5ZhfaIFs
	hMNxAJfM73ol4Cbn1eeYGa2V+34FAizI2NAA=
X-Received: by 2002:a05:6102:3e0b:b0:739:5c3d:605b with SMTP id ada2fe7eead31-73da8836a74mr86220137.1.1782903719620;
        Wed, 01 Jul 2026 04:01:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0b:b0:739:5c3d:605b with SMTP id ada2fe7eead31-73da8836a74mr86169137.1.1782903719140;
        Wed, 01 Jul 2026 04:01:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c128917536csm257546366b.56.2026.07.01.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:01:58 -0700 (PDT)
Message-ID: <c93b47af-e291-4a6a-ae4b-cc46f25c422b@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:01:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/14] media: qcom: Pass proper PAS ID to
 set_remote_state API
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-11-sumit.garg@kernel.org>
 <c251430d-2184-4ecc-8d05-9cb47533e5ec@oss.qualcomm.com>
 <akTFZgKBQYQUYxx4@sumit-xelite>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akTFZgKBQYQUYxx4@sumit-xelite>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: biK8XJM3odugdxHEIAQ96WuHsqjKLokv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX57yvh2r+b8z3
 OI3Dl63izeLgONiD21b7aXu977HLrVajr8dTz7hjxeA5q7BkTXdOgyXKSCkcK6UkzCntOMp0H64
 tIhyWDTcLKE5lVzrPrGnwWGfG7bdjS87Jm9h4OLmLGwuHlAKtEhl58fO54ilRWaTTSLY/eyQdMI
 gJjrEtMerk2EmW39gSKxsfejuif6DGeI8ya6mhaE5q7Sb+xGGtL+BTBpQtSqc7+vfz0PUbu+1vi
 HTXi/50k5CbJ9U+Rgv86I4diw+N1B292milyowButt8sQKWriPS16oiv47nlXOvswQOiKUfQ9n0
 cDUfdiOLx5N30480V/FlNEYMQbErLJkZh4E+mWdt2CSfuxlly1uAd8OhQXvaypS2/qtfXfVR1FO
 jkrAJaXqLCfRM88StDaCSYMRpwkDjmM3+utESRIWFgr2kTlVTWykyOYc1y55Ww8gdh6pY0ZuP4y
 D5yCAdD5ykFDqVLCmxw==
X-Proofpoint-ORIG-GUID: biK8XJM3odugdxHEIAQ96WuHsqjKLokv
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44f3a8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uyZSW4wqkseYk8rkHTIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNSBTYWx0ZWRfX8LswrMH/MXYK
 06CTGEwrOQA7BE3W4SPub/z0A0oI7CzuJQLBKFLYncfqPd7fG9hQcHfXxiz+paU7VH++Y9h0pC+
 SdiaHbBdZ7GyJAaRMSG3e+vqx1KTtyM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-115673-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A19396EC8BA

On 7/1/26 9:44 AM, Sumit Garg wrote:
> On Tue, Jun 30, 2026 at 02:42:25PM +0200, Konrad Dybcio wrote:
>> On 6/26/26 3:34 PM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> As per testing the SCM backend just ignores it while OP-TEE makes
>>> use of it to for proper book keeping purpose.
>>>
>>> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>>>  drivers/media/platform/qcom/venus/firmware.c     | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> index ea9654dd679e..d2e7ba4f37e3 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>>> @@ -110,5 +110,5 @@ int iris_fw_unload(struct iris_core *core)
>>>  
>>>  int iris_set_hw_state(struct iris_core *core, bool resume)
>>>  {
>>> -	return qcom_pas_set_remote_state(resume, 0);
>>> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>>>  }
>>> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
>>> index 3a38ff985822..3c0727ea137d 100644
>>> --- a/drivers/media/platform/qcom/venus/firmware.c
>>> +++ b/drivers/media/platform/qcom/venus/firmware.c
>>> @@ -59,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>>>  	int ret;
>>>  
>>>  	if (core->use_tz) {
>>> -		ret = qcom_pas_set_remote_state(resume, 0);
>>> +		ret = qcom_pas_set_remote_state(resume, VENUS_PAS_ID);
>>
>> This should not be in the middle of a mildly related series..
>> The PAS IDs should be centralized into a single header. And the
>> name of the driver shouldn't be part of the define. I would guesstimate
>> that on the secure side it's probably called VPU or VIDEO
> 
> I agree with your comments, this is something I would also like to
> consolidate on OP-TEE side as well: see discussion here [1].
> 
> However, the patch itself was needed to do book keeping on OP-TEE side
> but I can drop it since anyhow the video isn't functional yet in
> upstream dependent on the proper IOMMU support.

For this patch.. I think QCTZ may be ignoring the argument so it
may not matter.. on a second thought you already have it reviewed
and it's already a cross-subsys merge so might as well pull it in,
worst case scenario it'll revert cleanly

Once this lands, please move all PAS defines to.. hmm.. qcom_pas.h
sounds like a good candidate?

Konrad

