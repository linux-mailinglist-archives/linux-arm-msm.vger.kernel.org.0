Return-Path: <linux-arm-msm+bounces-91450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDIMA4FvgGkw8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:33:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C17CA278
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D96A301588F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 09:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448702DB797;
	Mon,  2 Feb 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hl3Huccn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGtvUyzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2C22D3739
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770024828; cv=none; b=Yf3GAuY0iLkY8Ib1bxZcp9qMsYhwStah4nG0l7yqGLpi+/eurG+cVDlESvSfwoQMOjCGb9hmyOB1rcyTXg96oLSD0c2QAlhgPjvylBVRftuVd5HTSl25BKKZcn3DWVHGKDHt5gY0xCoWHmp5O5Su9bfgMi1FjkIvV1nhOPdPNZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770024828; c=relaxed/simple;
	bh=unPEm+1NIuStqMpaoStpa+gtyzS7uVlA6g5lUzFR8+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOntkrTxCjuyKCyswnxYSLUYxKCq5VkCVkhJObR+mztR30oBuva19wTtKOvPXFvHgRh+zmyYiIGMFHv0gz5fk6FU27jgBoW/x3x3HENpL+oSDEiCBFDvMulGxOdYxAnSB7RhioR/AOLqtF5fZEqPmglCOvaE+byZyvZ9VeswLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hl3Huccn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGtvUyzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285PJg2219286
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 09:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gJHUyMi6ir8MaZUDuIcqes/3
	jjyrEWI6G8BBp7lKnpE=; b=Hl3HuccnZ9mJUs/r4VlQZnnsosIAWNfR2vQHiS+/
	8n/D/M2wTxSe4A9Og319ZFJrlavT3UzMSVA9T4KgIhbepGaOTDYYNo4bHHm/HoHA
	YefCr6YKsDGtjRSjEcieIzCRAZvS9F7xi4I+8KhCqRqLKNmnWubEKBTEdCm0fe1f
	OL8Z3D33FxT/TQyWXLgSWMnX7zUoPvnnUjBX0S/YZbZ/r6YIYP2Ar7F6zNAIf0QX
	khNC+mpvtkNHs5PdqNa6mQGtBFRds2W/4u+E/yzRO1OK3QEnB0oMN5/BCknFLCns
	hbdEA8QSY4TxRMT8nPsdokwRZ2b5xYqy7LdUDBqSMAwuVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1ard4w0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 09:33:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a07fa318fdso44316005ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 01:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770024824; x=1770629624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gJHUyMi6ir8MaZUDuIcqes/3jjyrEWI6G8BBp7lKnpE=;
        b=GGtvUyzYI7Vd+rMT360OrD+AnnJl3Caywsio+S267wzXKcnqjEPY+r0oczONwRqZ7V
         nTSdhbfzLZDwl9w5I94x1b2q5ToLABxVmhPGggbgYoE6J4A7I9Enmie9Gt/p9U0FqEpX
         iuPMD2FHRPmoovL+SqIpk8jOGhasf3lI1zobUId1RQ++OQrYf9ulYO3Wsp//+y3uHXll
         JfqcazVgNzoSpTBDDb5DsfTZS7WobqtL3lu6cA9fFnsLUrM+1wA3GeB1yzShclW7x5N1
         IqHGSOrqSqbSCyOOr/s7P05gdsX+76pevJFjM6LbRkhz/8MmmrAuQA3iGtsEVVpdadUt
         cymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770024825; x=1770629625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJHUyMi6ir8MaZUDuIcqes/3jjyrEWI6G8BBp7lKnpE=;
        b=G+3s3BmqEPpRhEoM/vhb0B8WEj9LPwqf4WksbHhrYEzTtFQRmDD5bNa9kR8lvbj66f
         KnHyYKIXrpSSrH54XBWapOLbsU1i4GkMBmk8mA21hEuhyT49Hp4GWnTemQvl7BZJVpP3
         2EpVY1IotgVrXJlpwKs/TbPMDlFq4KV1kh8uRpVAQCYi6J/xvTZRMkEfPTDvysrdOFLu
         fpSgLFgUa5bhcYzb2O9Bvf49Yv/Uz1dDXl2YJm4QMnPUwNgvQbpMEJL5NSxiMBpjPjmT
         Fg2K6Zbi+ckhjvqJKMAI0VDYJPaAbfpIMPiNK/nc/Iav4RjUAlUCir/scXHDpExJJPea
         dFqg==
X-Forwarded-Encrypted: i=1; AJvYcCVuDXFpuqUkn/daWMTx8VHAv/EBfYEI8v+D5SZJ1oAZdnd6y8k3kgwIOWapfmNkWUXlX7ppEOhGscrZC2jw@vger.kernel.org
X-Gm-Message-State: AOJu0YzvL8uT30O/MrMp2B5b7kNntBpYYeSok6nqEtZhd0SpdSO0kfsB
	It7YYGAh17Tb7T28z6U6+lXLQFHvYP4iU0JBPn8GIwG/6IS7BUEvg5gXxRHAyptomk74Jz3NA16
	nhynpRY/G+VO4K/dX0MoRtPN9feb1UPY/Mhwm9D2tpE8CT4zqSo5uQ1WrWwvv69PAAaOT
X-Gm-Gg: AZuq6aKJ9ljBIKwQQeJOcRgXFOd98GmrmgSGlJR8Z0y5MMMTZOjEGHD3t2R/X31UDNP
	qZBB8dqQq41jNn6nPYUpk82IBEElvRNMdwA+7/WOnegx/wVkjTNKgFB6y5QKmQM9CGEed3cvUxI
	VEL/2rQyf0kPnLf3iLZK/rPwcT+rSOmaX1huxZ33az2z47NgDMHVbsj8hPghftgWvPciMJQg3G6
	Ni3/J6/ip270i5ahpDPLHHNXv/p8YkSbmlB0iGqhOPUCmP6wSn0t6lXg8C5gtkqdNzge7evWRv0
	pBxgteRR9tB6X17OhJME47Nq2rZUq6j5zi7VlttOLCpXMS43WT/re88Tt4WW6dDz1B+sDY+aaws
	3J+2KRSJT78AvU3JJl0PmqosVzQwXqBC6FFlYyPXyx6IQ5Es=
X-Received: by 2002:a17:903:1a83:b0:2a7:87c0:2357 with SMTP id d9443c01a7336-2a8d96b18f9mr124758735ad.20.1770024824523;
        Mon, 02 Feb 2026 01:33:44 -0800 (PST)
X-Received: by 2002:a17:903:1a83:b0:2a7:87c0:2357 with SMTP id d9443c01a7336-2a8d96b18f9mr124758425ad.20.1770024824050;
        Mon, 02 Feb 2026 01:33:44 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414f1esm139990075ad.24.2026.02.02.01.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:33:43 -0800 (PST)
Date: Mon, 2 Feb 2026 15:03:36 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aYBvcBFVhwbV4UEH@hu-arakshit-hyd.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <20260128-enable-ufs-ice-clock-scaling-v4-2-260141e8fce6@oss.qualcomm.com>
 <20260128-daft-seriema-of-promotion-c50eb5@quoll>
 <aYBE/VljJTUNx3LK@hu-arakshit-hyd.qualcomm.com>
 <13e311fb-1298-422c-8859-1b08201743ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13e311fb-1298-422c-8859-1b08201743ab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4MiBTYWx0ZWRfX6zPEs8y7kSUg
 S7ftJlj/wLE0d1aCTpbPCKO2P6aRqd3rh2KJ59A/vZb89fcKYoxbuS+JSeFT4Y/YwE5rHdWGtrB
 sJd1StnzhEo1dLr8mwFQfgn63ufuoa8/lCmrbKmkzaGi3qJfMY8ZrHcvBeGzBJSdcqLU1Jlqmi2
 JXcO6mnNhyeW68b3OiQ6V2Wil1mLaIHXLU8Imltf8j7aEhqyjK9MsZqggtWDpX4n6lZaWCNm7qR
 iZgYshR5URAUpbP+97Y2wVVfujdIGSGSD3ngN3WzeBz5r3Zar94AUZSEqdg9CAOY6OSxGA4RPE5
 YOoNTroeC+BaaRkYtT46OUStSVg4b6KFq+5exYjrgNUyAqQNqLxravcppNx3oIhidg9Y2UmBWJ7
 L8lwxdB5KkrwESPOPz708aSsQhm+6kKJA/ulXM6Z48ol1RCigkAqwY1SiyNJU/OT4wsJjnFlaZF
 9gmzZdUIRD3LkxM1J8A==
X-Authority-Analysis: v=2.4 cv=J6anLQnS c=1 sm=1 tr=0 ts=69806f79 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=L9uGvZmjxWfCn8EH7uIA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: wXcmnkJ7WCbWSHC9BtJzKhtpit79fmb6
X-Proofpoint-GUID: wXcmnkJ7WCbWSHC9BtJzKhtpit79fmb6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91450-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,hu-arakshit-hyd.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75C17CA278
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:23:43AM +0100, Konrad Dybcio wrote:
> On 2/2/26 7:32 AM, Abhinaba Rakshit wrote:
> > On Wed, Jan 28, 2026 at 12:04:26PM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Jan 28, 2026 at 02:16:41PM +0530, Abhinaba Rakshit wrote:
> >>>  	struct qcom_ice *engine;
> >>> +	struct dev_pm_opp *opp;
> >>> +	int err;
> >>> +	unsigned long rate;
> >>>  
> >>>  	if (!qcom_scm_is_available())
> >>>  		return ERR_PTR(-EPROBE_DEFER);
> >>> @@ -584,6 +651,46 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>>  	if (IS_ERR(engine->core_clk))
> >>>  		return ERR_CAST(engine->core_clk);
> >>>  
> >>> +	/* Register the OPP table only when ICE is described as a standalone
> >>
> >> This is not netdev...
> > 
> > Okay, if I understand it correct, its not conventional to use of_device_is_compatible
> > outside netdev subsystem. Will update as mentioned below.
> 
> In Linux
> 
> /*
>  * This style of comments is generally preferred
> 
> unless
> 
> /* You're contributing to netdev for weird legacy reasons
>  * that nobody seems to understand

I see. Thanks for correcting me.
Will keep this in mind while submitting subsequent patches. 

