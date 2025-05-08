Return-Path: <linux-arm-msm+bounces-57236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2BAAF6A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 11:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EE901BC67B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 09:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09F82144AD;
	Thu,  8 May 2025 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsOgxZiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2BE1E22E9;
	Thu,  8 May 2025 09:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696075; cv=none; b=uLQL73KjhVotI+s4vTS2iXdr8X0uMZ/3pp9h4hVb+Bc6JJv5m1D6J0t/MVF6kEDiegwQ1KCPigJrxeuDt6PaZrAR502wrfN4wv/OTsOsF5AnJNNioIOn81n581gK5f+0BwHTovKjLuSfL02MmHE/ekRnFN+nbuEfohruosr/NW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696075; c=relaxed/simple;
	bh=ZZwOfmsV6qwFd2mkj0wiXHd0OARcjgbvTjj8X00+fkE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gqFwoCK4MsuB93F9MfV8h3I1ZlM+9/gbkUtm9oA0VUJF8U+M6ntv5w0bnGOjjXwMdoBNgxQtoDV/sd02HpuB/EC80xNTo/BsaOs9CKOfd6zaNpHPuejVklVyE9r3HTNUsbrdJfRsEU4cgKL5IIwSvnkNZWCMwduiT/q9Pnu98hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsOgxZiK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac339f53df9so126572166b.1;
        Thu, 08 May 2025 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746696072; x=1747300872; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZZwOfmsV6qwFd2mkj0wiXHd0OARcjgbvTjj8X00+fkE=;
        b=nsOgxZiKD+pqEE3RM5jKd51q8s2SjNFYqEHnWEww8pazxHPlU5PEqs6/umzzclHZ6u
         yTBmbTXaUYSnj/U6LTU0w2TAqSQRCarfAYNQTb44MYgqn5cGgFVTOknQmFUCFIBt4dzx
         lXmeuq2HAgxHq3R6XLYyEtVym7P34jtH8tXm6E+fKdtvqwEVN6pO6vcIFrAaC+sDBbLk
         TqGVLPGPMi8nmmL7p0eb6dFVaXd/4bne1zSWs1pTZByuu6JdxRWJbC1pk4924L3N45kO
         E9C4iMIY/E2zn2nMj014zG540bVdg/QU1fHda/gEf+bJM+/vaLHgfVvUB+l01AHuntDo
         YbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746696072; x=1747300872;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZwOfmsV6qwFd2mkj0wiXHd0OARcjgbvTjj8X00+fkE=;
        b=wOlZa8NXIdmzab7k2VkFN/eGj8SoCffAyhgey3zCiK+Ca2bavLb+DWAdC8MIGDI26Y
         lmbUjNG1pzZHt01E2WYZQEe+g9RLbi/UIyvs5A/kYLnVZqNezOXkVwMfp4TJ98UUJhkI
         JixcGK3D2pyDSQ7NjuzOUVSD/36sx94tcMs4MijZlg5RpSAL/U7IhcVPDppzvS8hXLnt
         OEC2HbZCC/qLOlSX7G0q/NCnAUSlQ/oSdK6iboJ5i+rPes6HfLRkA7kAod0wILQo5Bm0
         Z6UEDF+3OyQPTGfpVusutrN6BE0MExmykJtWRHcQHRJ4RElEpLwj6OVzNrznCwf5bxTQ
         XArA==
X-Forwarded-Encrypted: i=1; AJvYcCV0C3XfvAK/WIX7Ztg5GFPN6g+HSUra7OkFYBKfEejTltqvN5hkThVUgwuM8Z52fU7UJYmduOmbI02XHw==@vger.kernel.org, AJvYcCXHeAmi5HFbtqPOi5gWKnSQZFkdQgNjDRGbAxKEqhSk81v/C8nsbv8POAW4iqvDAAo0YDWy2bvJVmZY4TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO6sCtvQY+b75eX+V1xYaEMwABsH7Gugy6SqYPd+6Dlakp9qJR
	EzWELTqObyusyX+0BjgT9k/Dwgk8Go1xlTXJmuy0w/2hPt5NHLQu
X-Gm-Gg: ASbGncs+1Jq5NkflmEvHXnFHaDD8KzxAVDeUI8RcJu5bQCrSteiD5K6kGrAM5ADyaOC
	WQLwZIE7EEYh/T/dgPLjZ2RneDuOOs9Cqo/0YLSIVi6ilACX22Zr65b1e2uFhYTjKE+nsWt72CT
	ezZfi2DJh9pXU5SVHzX7GfXtQDIXVXMAZyBhxYSQTZlU0LU8dn1Tsm0X3pbFNRQ6aMvpyhT7Ume
	gprZVU7BdXgH72HKyyzBXagK7LkfTyGAZpsVKl9RVovYAN269lrXrW7Sja/4RRb+apf/vF04YWe
	G4lgUabnh+CtZcjRNYKYfgfuhwIzJualZIFRfI1HDCo=
X-Google-Smtp-Source: AGHT+IFPf1Qh3KNKTnQO0udn+T730YYO2gH+fHK0l1zsCqoKftabDd58YKQBwuSfKFuy8+Fv+zV1Qw==
X-Received: by 2002:a17:907:7da9:b0:acb:5f9a:72f4 with SMTP id a640c23a62f3a-ad1e8bf688cmr576012266b.30.1746696072039;
        Thu, 08 May 2025 02:21:12 -0700 (PDT)
Received: from [10.176.234.34] ([137.201.254.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d6esm1046713166b.185.2025.05.08.02.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:21:11 -0700 (PDT)
Message-ID: <4575f37d5221048bfd061c561e42389ae569ca39.camel@gmail.com>
Subject: Re: [PATCH v2 2/3] scsi: ufs: qcom: Map devfreq OPP freq to UniPro
 Core Clock freq
From: Bean Huo <huobean@gmail.com>
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com, 
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com,  junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com,  quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, neil.armstrong@linaro.org, 
 luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, Manivannan
	Sadhasivam <manivannan.sadhasivam@linaro.org>, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, open list
	 <linux-kernel@vger.kernel.org>
Date: Thu, 08 May 2025 11:21:10 +0200
In-Reply-To: <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
	 <20250507074415.2451940-3-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gV2VkLCAyMDI1LTA1LTA3IGF0IDE1OjQ0ICswODAwLCBaaXFpIENoZW4gd3JvdGU6Cj4gLcKg
wqDCoMKgwqDCoMKgcmV0dXJuIHVmc19xY29tX3NldF9jb3JlX2Nsa19jdHJsKGhiYSwgZnJlcSk7
Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHVmc19xY29tX3NldF9jb3JlX2Nsa19jdHJsKGhiYSwg
ZmFsc2UsIGZyZXEpOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IHVmc19xY29tX2Nsa19zY2Fs
ZV9ub3RpZnkoc3RydWN0IHVmc19oYmEgKmhiYSwgYm9vbCBzY2FsZV91cCwKPiBAQCAtMjA4MSwx
MSArMjEwMCw1MyBAQCBzdGF0aWMgaW50IHVmc19xY29tX2NvbmZpZ19lc2koc3RydWN0IHVmc19o
YmEgKmhiYSkKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoH0KPiDCoAo+ICtzdGF0
aWMgdW5zaWduZWQgbG9uZyB1ZnNfcWNvbV9vcHBfZnJlcV90b19jbGtfZnJlcShzdHJ1Y3QgdWZz
X2hiYSAqaGJhLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZyZXEs
IGNoYXIgKm5hbWUpCgoKVGhpcyB0YWIgaW5kZW50YXRpb24gaXMgc3RyYW5nZSEKCgo+ICt7Cj4g
K8KgwqDCoMKgwqDCoMKgc3RydWN0IHVmc19jbGtfaW5mbyAqY2xraQoK


