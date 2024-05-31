Return-Path: <linux-arm-msm+bounces-21197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5928D5BA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0739D28713A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 07:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55D37405E;
	Fri, 31 May 2024 07:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="BCPckN5Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6F174057;
	Fri, 31 May 2024 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717141105; cv=none; b=JDEiK/vOybc72MiAyuPESHERbu1XT2KWvC+xsmzRkdUFzo4m9lRxhlc7S3NosmFk7KsKmmyT5DL6zQeVNaU/1Y1t6O2sndApvHI5/11ZGF3DwM53+/DefYRWQu438V2QciN2fqM6a3+uWDYNqrtMcvGUYoOI3IeVuoDeYz25XtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717141105; c=relaxed/simple;
	bh=js5resTiNiwmEEem06d/OuXesOvzyPwOVOw2TBNTQbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=ANIlJ+vJcX7JK5REfh91i7hkdmZwUZa8ev9CLiR/ILtrS3T43Bql87qHsfbEjhc4N/MXabgjF45JS4AgO77s7lYiLxP+xf2Y9dXPZYXccSuDKzA9vRnk8IY0EIz+/Eaw5TZBuhZ/iNNDUnr2hv87iCJZtEiNqk5eSdHmZsUb12U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=BCPckN5Y reason="signature verification failed"; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=0RpQFpiJt8CzmW+XjzYB0uoC6szcClZV35OrD8T37uk=; b=B
	CPckN5YRlbjf2sLpOtaYcpqabr6qCrqYwbbpbR1hMt+0JKVIVPQ0hWzL8B9aP2DP
	DOyKx5aH4cfFS7D1o2Jw06BjgoNxuWIHAr4olB8lx9Q3y6E3fc3hYG1xeqR9F4Rr
	VOnP7oilp9x1pWCz4yiDjEAiJ1AC3Lg+OLrYYFNjfo=
Received: from slark_xiao$163.com ( [112.97.59.81] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Fri, 31 May 2024 15:37:44 +0800
 (CST)
Date: Fri, 31 May 2024 15:37:44 +0800 (CST)
From: "Slark Xiao" <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org, loic.poulain@linaro.org
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re:[PATCH v2] bus: mhi: host: Add Foxconn SDX72 related support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <20240520070633.308913-1-slark_xiao@163.com>
References: <20240520070633.308913-1-slark_xiao@163.com>
X-NTES-SC: AL_Qu2aBf2fvkgt4iaYZOkfm0kaj+c/WMGzu/8m3oFXO51wjD/pywQrRn54L3f89cW2Ey6orCOsUCBfx8BTf4BKYYY0gpe02UgZEjAjz22mxWjh+A==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1ecf7fb9.74d7.18fcd954b9e.Coremail.slark_xiao@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3n39IfllmFNUdAA--.22369W
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQjvZGV4H26udAAAsA
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgTWFuaSwKRG8geW91IG1pc3MgdGhpcyBjb21taXQ/CkkgZGlkbid0IGdldCBhbnkgcmVzcG9u
c2UgeWV0LiAKCkF0IDIwMjQtMDUtMjAgMTU6MDY6MzMsICJTbGFyayBYaWFvIiA8c2xhcmtfeGlh
b0AxNjMuY29tPiB3cm90ZToKPkFsaWduIHdpdGggUWNvbSBTRFg3MiwgYWRkIHJlYWR5IHRpbWVv
dXQgaXRlbSBmb3IgRm94Y29ubiBTRFg3Mi4KPkFuZCBhbHNvLCBhZGQgZmlyZWhvc2Ugc3VwcG9y
dCBzaW5jZSBTRFg3Mi4KPgo+U2lnbmVkLW9mZi1ieTogU2xhcmsgWGlhbyA8c2xhcmtfeGlhb0Ax
NjMuY29tPgo+LS0tCj52MjogKDEpLiBVcGRhdGUgdGhlIGVkbCBmaWxlIHBhdGggYW5kIG5hbWUg
KDIpLiBTZXQgU0RYNzIgc3VwcG9ydAo+dHJpZ2dlciBlZGwgbW9kZSBieSBkZWZhdWx0Cj4tLS0K
PiBkcml2ZXJzL2J1cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jIHwgMzIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPgo+ZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMgYi9kcml2ZXJzL2J1
cy9taGkvaG9zdC9wY2lfZ2VuZXJpYy5jCj5pbmRleCAwODg0NGVlNzk2NTQuLjBiNDgzYzdjNzZh
MSAxMDA2NDQKPi0tLSBhL2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPisrKyBi
L2RyaXZlcnMvYnVzL21oaS9ob3N0L3BjaV9nZW5lcmljLmMKPkBAIC0zOTksNiArMzk5LDggQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfY2hhbm5lbF9jb25maWcgbWhpX2ZveGNvbm5fc2R4NTVf
Y2hhbm5lbHNbXSA9IHsKPiAJTUhJX0NIQU5ORUxfQ09ORklHX0RMKDEzLCAiTUJJTSIsIDMyLCAw
KSwKPiAJTUhJX0NIQU5ORUxfQ09ORklHX1VMKDMyLCAiRFVOIiwgMzIsIDApLAo+IAlNSElfQ0hB
Tk5FTF9DT05GSUdfREwoMzMsICJEVU4iLCAzMiwgMCksCj4rCU1ISV9DSEFOTkVMX0NPTkZJR19V
TF9GUCgzNCwgIkZJUkVIT1NFIiwgMzIsIDApLAo+KwlNSElfQ0hBTk5FTF9DT05GSUdfRExfRlAo
MzUsICJGSVJFSE9TRSIsIDMyLCAwKSwKPiAJTUhJX0NIQU5ORUxfQ09ORklHX0hXX1VMKDEwMCwg
IklQX0hXMF9NQklNIiwgMTI4LCAyKSwKPiAJTUhJX0NIQU5ORUxfQ09ORklHX0hXX0RMKDEwMSwg
IklQX0hXMF9NQklNIiwgMTI4LCAzKSwKPiB9Owo+QEAgLTQxOSw2ICs0MjEsMTYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtaGlfY29udHJvbGxlcl9jb25maWcgbW9kZW1fZm94Y29ubl9zZHg1NV9j
b25maWcgPSB7Cj4gCS5ldmVudF9jZmcgPSBtaGlfZm94Y29ubl9zZHg1NV9ldmVudHMsCj4gfTsK
PiAKPitzdGF0aWMgY29uc3Qgc3RydWN0IG1oaV9jb250cm9sbGVyX2NvbmZpZyBtb2RlbV9mb3hj
b25uX3NkeDcyX2NvbmZpZyA9IHsKPisJLm1heF9jaGFubmVscyA9IDEyOCwKPisJLnRpbWVvdXRf
bXMgPSAyMDAwMCwKPisJLnJlYWR5X3RpbWVvdXRfbXMgPSA1MDAwMCwKPisJLm51bV9jaGFubmVs
cyA9IEFSUkFZX1NJWkUobWhpX2ZveGNvbm5fc2R4NTVfY2hhbm5lbHMpLAo+KwkuY2hfY2ZnID0g
bWhpX2ZveGNvbm5fc2R4NTVfY2hhbm5lbHMsCj4rCS5udW1fZXZlbnRzID0gQVJSQVlfU0laRSht
aGlfZm94Y29ubl9zZHg1NV9ldmVudHMpLAo+KwkuZXZlbnRfY2ZnID0gbWhpX2ZveGNvbm5fc2R4
NTVfZXZlbnRzLAo+K307Cj4rCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZv
IG1oaV9mb3hjb25uX3NkeDI0X2luZm8gPSB7Cj4gCS5uYW1lID0gImZveGNvbm4tc2R4MjQiLAo+
IAkuY29uZmlnID0gJm1vZGVtX2ZveGNvbm5fc2R4NTVfY29uZmlnLAo+QEAgLTQ0OCw2ICs0NjAs
MTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfcGNpX2Rldl9pbmZvIG1oaV9mb3hjb25uX3Nk
eDY1X2luZm8gPSB7Cj4gCS5zaWRlYmFuZF93YWtlID0gZmFsc2UsCj4gfTsKPiAKPitzdGF0aWMg
Y29uc3Qgc3RydWN0IG1oaV9wY2lfZGV2X2luZm8gbWhpX2ZveGNvbm5fc2R4NzJfaW5mbyA9IHsK
PisJLm5hbWUgPSAiZm94Y29ubi1zZHg3MiIsCj4rCS5lZGwgPSAiZm94L3NkeDcybS9lZGwubWJu
IiwKPisJLmVkbF90cmlnZ2VyID0gdHJ1ZSwKPisJLmNvbmZpZyA9ICZtb2RlbV9mb3hjb25uX3Nk
eDcyX2NvbmZpZywKPisJLmJhcl9udW0gPSBNSElfUENJX0RFRkFVTFRfQkFSX05VTSwKPisJLmRt
YV9kYXRhX3dpZHRoID0gMzIsCj4rCS5tcnVfZGVmYXVsdCA9IDMyNzY4LAo+Kwkuc2lkZWJhbmRf
d2FrZSA9IGZhbHNlLAo+K307Cj4rCj4gc3RhdGljIGNvbnN0IHN0cnVjdCBtaGlfY2hhbm5lbF9j
b25maWcgbWhpX212M3hfY2hhbm5lbHNbXSA9IHsKPiAJTUhJX0NIQU5ORUxfQ09ORklHX1VMKDAs
ICJMT09QQkFDSyIsIDY0LCAwKSwKPiAJTUhJX0NIQU5ORUxfQ09ORklHX0RMKDEsICJMT09QQkFD
SyIsIDY0LCAwKSwKPkBAIC02ODAsNiArNzAzLDE1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCBtaGlfcGNpX2lkX3RhYmxlW10gPSB7Cj4gCS8qIERXNTkzMmUgKHNkeDYyKSwg
Tm9uLWVTSU0gKi8KPiAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRk9YQ09OTiwgMHhlMGY5
KSwKPiAJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9mb3hjb25uX3NkeDY1
X2luZm8gfSwKPisJLyogVDk5VzUxNSAoc2R4NzIpICovCj4rCXsgUENJX0RFVklDRShQQ0lfVkVO
RE9SX0lEX0ZPWENPTk4sIDB4ZTExOCksCj4rCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25n
X3QpICZtaGlfZm94Y29ubl9zZHg3Ml9pbmZvIH0sCj4rCS8qIERXNTkzNGUoc2R4NzIpLCBXaXRo
IGVTSU0gKi8KPisJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRk9YQ09OTiwgMHhlMTFkKSwK
PisJCS5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkgJm1oaV9mb3hjb25uX3NkeDcyX2lu
Zm8gfSwKPisJLyogRFc1OTM0ZShzZHg3MiksIE5vbi1lU0lNICovCj4rCXsgUENJX0RFVklDRShQ
Q0lfVkVORE9SX0lEX0ZPWENPTk4sIDB4ZTExZSksCj4rCQkuZHJpdmVyX2RhdGEgPSAoa2VybmVs
X3Vsb25nX3QpICZtaGlfZm94Y29ubl9zZHg3Ml9pbmZvIH0sCj4gCS8qIE1WMzEtVyAoQ2ludGVy
aW9uKSAqLwo+IAl7IFBDSV9ERVZJQ0UoUENJX1ZFTkRPUl9JRF9USEFMRVMsIDB4MDBiMyksCj4g
CQkuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpICZtaGlfbXYzMV9pbmZvIH0sCj4tLSAK
PjIuMjUuMQo=

