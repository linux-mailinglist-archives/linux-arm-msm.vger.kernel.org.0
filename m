Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1716E72FD6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 13:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244300AbjFNLxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 07:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244297AbjFNLw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 07:52:58 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960BF1BF3;
        Wed, 14 Jun 2023 04:52:56 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 438CD21854;
        Wed, 14 Jun 2023 11:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686743575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1ACAQe4eQYE40x3HpvzCeA0WZRx83yuDK0LqbucCXHU=;
        b=atYTSelLioj1oTT5IPBBT4N3bg1AbZ3tOcqNMUMN4AyissB6x6OXBwN/ANqe6jwxp5aJmA
        YOOEk5y9bYSOZ+in/nUfLpqhMOjXsddBjxyOLokL/JMNoTuZJAtyAdvNOhoELFkBKbjpT/
        IWgeANNsWv4geDBw0ctnBHbXdNP1/DE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686743575;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1ACAQe4eQYE40x3HpvzCeA0WZRx83yuDK0LqbucCXHU=;
        b=6lRJj0Lf3dINkbqGSf0gVVxqYZPryYtYpZx020YLArI2z16quUjsyu1K58qwNiu+NfOTb7
        DIXOO7JJ8Md/5FDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2AF11391E;
        Wed, 14 Jun 2023 11:52:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id P/GNLhaqiWTvJwAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Wed, 14 Jun 2023 11:52:54 +0000
Message-ID: <28d339a4-c3a3-e1a4-1da2-59042428d786@suse.de>
Date:   Wed, 14 Jun 2023 13:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 02/13] fbdev: Add initializer macros for struct fb_ops
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org, suijingfeng@loongson.cn
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230530150253.22758-1-tzimmermann@suse.de>
 <20230530150253.22758-3-tzimmermann@suse.de>
 <fc5157cc-6f23-a74f-efcc-66bd7e093de7@gmail.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <fc5157cc-6f23-a74f-efcc-66bd7e093de7@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iQql70Vea1C4kMG6KF3BooR6"
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iQql70Vea1C4kMG6KF3BooR6
Content-Type: multipart/mixed; boundary="------------r6QVpEGW1WeVo3vErBpHD1G8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org,
 suijingfeng@loongson.cn
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <28d339a4-c3a3-e1a4-1da2-59042428d786@suse.de>
Subject: Re: [PATCH v5 02/13] fbdev: Add initializer macros for struct fb_ops
References: <20230530150253.22758-1-tzimmermann@suse.de>
 <20230530150253.22758-3-tzimmermann@suse.de>
 <fc5157cc-6f23-a74f-efcc-66bd7e093de7@gmail.com>
In-Reply-To: <fc5157cc-6f23-a74f-efcc-66bd7e093de7@gmail.com>

--------------r6QVpEGW1WeVo3vErBpHD1G8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDYuMjMgdW0gMTM6Mjkgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiANCj4gDQo+IEFtIDMwLjA1LjIzIHVtIDE3OjAyIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1h
bm46DQo+PiBGb3IgZnJhbWVidWZmZXJzIGluIEkvTyBhbmQgc3lzdGVtIG1lbW9yeSwgYWRk
IG1hY3JvcyB0aGF0IHNldA0KPj4gc3RydWN0IGZiX29wcyB0byB0aGUgcmVzcGVjdGl2ZSBj
YWxsYmFjayBmdW5jdGlvbnMuDQo+Pg0KPj4gRm9yIGRlZmVycmVkIEkvTywgYWRkIG1hY3Jv
cyB0aGF0IGdlbmVyYXRlIGNhbGxiYWNrIGZ1bmN0aW9ucyB3aXRoDQo+PiBkYW1hZ2UgaGFu
ZGxpbmcuIEFkZCBpbml0aWFsaXplciBtYWNyb3MgdGhhdCBzZXQgc3RydWN0IGZiX29wcyB0
bw0KPj4gdGhlIGdlbmVyYXRlZCBjYWxsYmFja3MuDQo+Pg0KPj4gVGhlc2UgbWFjcm9zIGNh
biByZW1vdmUgYSBsb3QgYm9pbGVycGxhdGUgY29kZSBmcm9tIGZiZGV2IGRyaXZlcnMuDQo+
PiBUaGUgZHJpdmVycyBhcmUgc3VwcG9zZWQgdG8gdXNlIHRoZSBtYWNybyB0aGF0IGlzIHJl
cXVpcmVkIGZvciBpdHMNCj4+IGZyYW1lYnVmZmVyLiBFYWNoIG1hY3JvIGlzIHNwbGl0IGlu
dG8gc21hbGxlciBoZWxwZXJzLCBzbyB0aGF0DQo+PiBkcml2ZXJzIHdpdGggbm9uLXN0YW5k
YXJkIGNhbGxiYWNrcyBjYW4gcGljayBhbmQgY3VzdG9taXplIGNhbGxiYWNrcw0KPj4gYXMg
bmVlZGVkLiBUaGVyZSBhcmUgaW5kaXZpZHVhbCBoZWxwZXIgbWFjcm9zIGZvciByZWFkL3dy
aXRlLCBtbWFwDQo+PiBhbmQgZHJhd2luZy4NCj4+DQo+PiB2NToNCj4+IMKgwqDCoMKgKiBm
aXggd2hpdGVzcGFjZSBlcnJvcnMgKEppbmdmZW5nKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gUmV2aWV3ZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4+IC0tLQ0KPj4gwqAgaW5j
bHVkZS9saW51eC9mYi5oIHwgMTEyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDExMiBpbnNlcnRpb25zKCsp
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGlu
dXgvZmIuaA0KPj4gaW5kZXggMmNmOGVmY2I5ZTMyLi5jZTY4MjNlMTU3ZTYgMTAwNjQ0DQo+
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIu
aA0KPj4gQEAgLTUzOCw5ICs1MzgsMzEgQEAgZXh0ZXJuIHNzaXplX3QgZmJfaW9fcmVhZChz
dHJ1Y3QgZmJfaW5mbyAqaW5mbywgDQo+PiBjaGFyIF9fdXNlciAqYnVmLA0KPj4gwqAgZXh0
ZXJuIHNzaXplX3QgZmJfaW9fd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IGNo
YXIgX191c2VyIA0KPj4gKmJ1ZiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKTsNCj4+ICsvKg0KPj4gKyAqIEluaXRp
YWxpemVzIHN0cnVjdCBmYl9vcHMgZm9yIGZyYW1lYnVmZmVycyBpbiBJL08gbWVtb3J5Lg0K
Pj4gKyAqLw0KPj4gKw0KPj4gKyNkZWZpbmUgX19GQl9ERUZBVUxUX0lPX09QU19SRFdSIFwN
Cj4+ICvCoMKgwqAgLmZiX3JlYWTCoMKgwqAgPSBmYl9pb19yZWFkLCBcDQo+PiArwqDCoMKg
IC5mYl93cml0ZcKgwqDCoCA9IGZiX2lvX3dyaXRlDQo+PiArDQo+PiArI2RlZmluZSBfX0ZC
X0RFRkFVTFRfSU9fT1BTX0RSQVcgXA0KPj4gK8KgwqDCoCAuZmJfZmlsbHJlY3TCoMKgwqAg
PSBjZmJfZmlsbHJlY3QsIFwNCj4+ICvCoMKgwqAgLmZiX2NvcHlhcmVhwqDCoMKgID0gY2Zi
X2NvcHlhcmVhLCBcDQo+PiArwqDCoMKgIC5mYl9pbWFnZWJsaXTCoMKgwqAgPSBjZmJfaW1h
Z2VibGl0DQo+PiArDQo+PiArI2RlZmluZSBfX0ZCX0RFRkFVTFRfSU9fT1BTX01NQVAgXA0K
Pj4gK8KgwqDCoCAuZmJfbW1hcMKgwqDCoCA9IE5VTEwgLy8gZGVmYXVsdCBpbXBsZW1lbnRh
dGlvbg0KPiANCj4gLy8gc3R5bGUgY29tbWVudCBpbiBhIG1hY3JvPyBUaGF0J3MgdXN1YWxs
eSBhIHZlcnkgYmFkIGlkZWEuDQoNCkkgdGhpbmsgSSBzZWUgaXQgbm93LiBUaGFua3MhIFRo
YXQgc2hvdWxkIGRlbGV0ZSBhbnkgY29tbWFzIGF0IHRoZSBlbmQgDQpvZiB0aGUgbGluZS4g
SSdsbCBzZW5kIG91dCBhbiB1cGRhdGUuIEl0IHdvcmtzIHNvIGZhciwgYXMgSSBvbmx5IHVz
ZWQgDQp0aGF0IG1hY3JvIGluIHRoZSBjb3JyZWN0IHdheS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gQ2hyaXN0aWFuLg0KPiANCj4+ICsNCj4+ICsjZGVmaW5lIEZCX0RF
RkFVTFRfSU9fT1BTIFwNCj4+ICvCoMKgwqAgX19GQl9ERUZBVUxUX0lPX09QU19SRFdSLCBc
DQo+PiArwqDCoMKgIF9fRkJfREVGQVVMVF9JT19PUFNfRFJBVywgXA0KPj4gK8KgwqDCoCBf
X0ZCX0RFRkFVTFRfSU9fT1BTX01NQVANCj4+ICsNCj4+IMKgIC8qDQo+PiDCoMKgICogRHJh
d2luZyBvcGVyYXRpb25zIHdoZXJlIGZyYW1lYnVmZmVyIGlzIGluIHN5c3RlbSBSQU0NCj4+
IMKgwqAgKi8NCj4+ICsNCj4+IMKgIGV4dGVybiB2b2lkIHN5c19maWxscmVjdChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbywgY29uc3Qgc3RydWN0IA0KPj4gZmJfZmlsbHJlY3QgKnJlY3QpOw0K
Pj4gwqAgZXh0ZXJuIHZvaWQgc3lzX2NvcHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLCBj
b25zdCBzdHJ1Y3QgDQo+PiBmYl9jb3B5YXJlYSAqYXJlYSk7DQo+PiDCoCBleHRlcm4gdm9p
ZCBzeXNfaW1hZ2VibGl0KHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBzdHJ1Y3QgDQo+
PiBmYl9pbWFnZSAqaW1hZ2UpOw0KPj4gQEAgLTU0OSw2ICs1NzEsMjcgQEAgZXh0ZXJuIHNz
aXplX3QgZmJfc3lzX3JlYWQoc3RydWN0IGZiX2luZm8gKmluZm8sIA0KPj4gY2hhciBfX3Vz
ZXIgKmJ1ZiwNCj4+IMKgIGV4dGVybiBzc2l6ZV90IGZiX3N5c193cml0ZShzdHJ1Y3QgZmJf
aW5mbyAqaW5mbywgY29uc3QgY2hhciBfX3VzZXIgDQo+PiAqYnVmLA0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcyk7
DQo+PiArLyoNCj4+ICsgKiBJbml0aWFsaXplcyBzdHJ1Y3QgZmJfb3BzIGZvciBmcmFtZWJ1
ZmZlcnMgaW4gc3lzdGVtIG1lbW9yeS4NCj4+ICsgKi8NCj4+ICsNCj4+ICsjZGVmaW5lIF9f
RkJfREVGQVVMVF9TWVNfT1BTX1JEV1IgXA0KPj4gK8KgwqDCoCAuZmJfcmVhZMKgwqDCoCA9
IGZiX3N5c19yZWFkLCBcDQo+PiArwqDCoMKgIC5mYl93cml0ZcKgwqDCoCA9IGZiX3N5c193
cml0ZQ0KPj4gKw0KPj4gKyNkZWZpbmUgX19GQl9ERUZBVUxUX1NZU19PUFNfRFJBVyBcDQo+
PiArwqDCoMKgIC5mYl9maWxscmVjdMKgwqDCoCA9IHN5c19maWxscmVjdCwgXA0KPj4gK8Kg
wqDCoCAuZmJfY29weWFyZWHCoMKgwqAgPSBzeXNfY29weWFyZWEsIFwNCj4+ICvCoMKgwqAg
LmZiX2ltYWdlYmxpdMKgwqDCoCA9IHN5c19pbWFnZWJsaXQNCj4+ICsNCj4+ICsjZGVmaW5l
IF9fRkJfREVGQVVMVF9TWVNfT1BTX01NQVAgXA0KPj4gK8KgwqDCoCAuZmJfbW1hcMKgwqDC
oCA9IE5VTEwgLy8gZGVmYXVsdCBpbXBsZW1lbnRhdGlvbg0KPj4gKw0KPj4gKyNkZWZpbmUg
RkJfREVGQVVMVF9TWVNfT1BTIFwNCj4+ICvCoMKgwqAgX19GQl9ERUZBVUxUX1NZU19PUFNf
UkRXUiwgXA0KPj4gK8KgwqDCoCBfX0ZCX0RFRkFVTFRfU1lTX09QU19EUkFXLCBcDQo+PiAr
wqDCoMKgIF9fRkJfREVGQVVMVF9TWVNfT1BTX01NQVANCj4+ICsNCj4+IMKgIC8qIGRyaXZl
cnMvdmlkZW8vZmJtZW0uYyAqLw0KPj4gwqAgZXh0ZXJuIGludCByZWdpc3Rlcl9mcmFtZWJ1
ZmZlcihzdHJ1Y3QgZmJfaW5mbyAqZmJfaW5mbyk7DQo+PiDCoCBleHRlcm4gdm9pZCB1bnJl
Z2lzdGVyX2ZyYW1lYnVmZmVyKHN0cnVjdCBmYl9pbmZvICpmYl9pbmZvKTsNCj4+IEBAIC02
MDQsNiArNjQ3LDc1IEBAIGV4dGVybiB2b2lkIGZiX2RlZmVycmVkX2lvX2NsZWFudXAoc3Ry
dWN0IGZiX2luZm8gDQo+PiAqaW5mbyk7DQo+PiDCoCBleHRlcm4gaW50IGZiX2RlZmVycmVk
X2lvX2ZzeW5jKHN0cnVjdCBmaWxlICpmaWxlLCBsb2ZmX3Qgc3RhcnQsDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvZmZfdCBlbmQsIGludCBkYXRhc3luYyk7
DQo+PiArLyoNCj4+ICsgKiBHZW5lcmF0ZSBjYWxsYmFja3MgZm9yIGRlZmVycmVkIEkvTw0K
Pj4gKyAqLw0KPj4gKw0KPj4gKyNkZWZpbmUgX19GQl9HRU5fREVGQVVMVF9ERUZFUlJFRF9P
UFNfUkRXUihfX3ByZWZpeCwgX19kYW1hZ2VfcmFuZ2UsIA0KPj4gX19tb2RlKSBcDQo+PiAr
wqDCoMKgIHN0YXRpYyBzc2l6ZV90IF9fcHJlZml4ICMjIF9kZWZpb19yZWFkKHN0cnVjdCBm
Yl9pbmZvICppbmZvLCBjaGFyIA0KPj4gX191c2VyICpidWYsIFwNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVfdCBjb3Vu
dCwgbG9mZl90ICpwcG9zKSBcDQo+PiArwqDCoMKgIHsgXA0KPj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiBmYl8gIyMgX19tb2RlICMjIF9yZWFkKGluZm8sIGJ1ZiwgY291bnQsIHBwb3Mp
OyBcDQo+PiArwqDCoMKgIH0gXA0KPj4gK8KgwqDCoCBzdGF0aWMgc3NpemVfdCBfX3ByZWZp
eCAjIyBfZGVmaW9fd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIA0KPj4gY29uc3QgY2hh
ciBfX3VzZXIgKmJ1ZiwgXA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpIFwNCj4+ICvCoMKg
wqAgeyBcDQo+PiArwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAqcHBv
czsgXA0KPj4gK8KgwqDCoMKgwqDCoMKgIHNzaXplX3QgcmV0ID0gZmJfICMjIF9fbW9kZSAj
IyBfd3JpdGUoaW5mbywgYnVmLCBjb3VudCwgcHBvcyk7IFwNCj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAocmV0ID4gMCkgXA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19kYW1hZ2Vf
cmFuZ2UoaW5mbywgb2Zmc2V0LCByZXQpOyBcDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsgXA0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiArI2RlZmluZSBfX0ZCX0dFTl9ERUZB
VUxUX0RFRkVSUkVEX09QU19EUkFXKF9fcHJlZml4LCBfX2RhbWFnZV9hcmVhLCANCj4+IF9f
bW9kZSkgXA0KPj4gK8KgwqDCoCBzdGF0aWMgdm9pZCBfX3ByZWZpeCAjIyBfZGVmaW9fZmls
bHJlY3Qoc3RydWN0IGZiX2luZm8gKmluZm8sIFwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBmYl9maWxscmVjdCAq
cmVjdCkgXA0KPj4gK8KgwqDCoCB7IFwNCj4+ICvCoMKgwqDCoMKgwqDCoCBfX21vZGUgIyMg
X2ZpbGxyZWN0KGluZm8sIHJlY3QpOyBcDQo+PiArwqDCoMKgwqDCoMKgwqAgX19kYW1hZ2Vf
YXJlYShpbmZvLCByZWN0LT5keCwgcmVjdC0+ZHksIHJlY3QtPndpZHRoLCANCj4+IHJlY3Qt
PmhlaWdodCk7IFwNCj4+ICvCoMKgwqAgfSBcDQo+PiArwqDCoMKgIHN0YXRpYyB2b2lkIF9f
cHJlZml4ICMjIF9kZWZpb19jb3B5YXJlYShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgXA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qg
c3RydWN0IGZiX2NvcHlhcmVhICphcmVhKSBcDQo+PiArwqDCoMKgIHsgXA0KPj4gK8KgwqDC
oMKgwqDCoMKgIF9fbW9kZSAjIyBfY29weWFyZWEoaW5mbywgYXJlYSk7IFwNCj4+ICvCoMKg
wqDCoMKgwqDCoCBfX2RhbWFnZV9hcmVhKGluZm8sIGFyZWEtPmR4LCBhcmVhLT5keSwgYXJl
YS0+d2lkdGgsIA0KPj4gYXJlYS0+aGVpZ2h0KTsgXA0KPj4gK8KgwqDCoCB9IFwNCj4+ICvC
oMKgwqAgc3RhdGljIHZvaWQgX19wcmVmaXggIyMgX2RlZmlvX2ltYWdlYmxpdChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbywgXA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZmJfaW1hZ2UgKmltYWdlKSBcDQo+PiAr
wqDCoMKgIHsgXA0KPj4gK8KgwqDCoMKgwqDCoMKgIF9fbW9kZSAjIyBfaW1hZ2VibGl0KGlu
Zm8sIGltYWdlKTsgXA0KPj4gK8KgwqDCoMKgwqDCoMKgIF9fZGFtYWdlX2FyZWEoaW5mbywg
aW1hZ2UtPmR4LCBpbWFnZS0+ZHksIGltYWdlLT53aWR0aCwgDQo+PiBpbWFnZS0+aGVpZ2h0
KTsgXA0KPj4gK8KgwqDCoCB9DQo+PiArDQo+PiArI2RlZmluZSBGQl9HRU5fREVGQVVMVF9E
RUZFUlJFRF9JT19PUFMoX19wcmVmaXgsIF9fZGFtYWdlX3JhbmdlLCANCj4+IF9fZGFtYWdl
X2FyZWEpIFwNCj4+ICvCoMKgwqAgX19GQl9HRU5fREVGQVVMVF9ERUZFUlJFRF9PUFNfUkRX
UihfX3ByZWZpeCwgX19kYW1hZ2VfcmFuZ2UsIGlvKSBcDQo+PiArwqDCoMKgIF9fRkJfR0VO
X0RFRkFVTFRfREVGRVJSRURfT1BTX0RSQVcoX19wcmVmaXgsIF9fZGFtYWdlX2FyZWEsIGNm
YikNCj4+ICsNCj4+ICsjZGVmaW5lIEZCX0dFTl9ERUZBVUxUX0RFRkVSUkVEX1NZU19PUFMo
X19wcmVmaXgsIF9fZGFtYWdlX3JhbmdlLCANCj4+IF9fZGFtYWdlX2FyZWEpIFwNCj4+ICvC
oMKgwqAgX19GQl9HRU5fREVGQVVMVF9ERUZFUlJFRF9PUFNfUkRXUihfX3ByZWZpeCwgX19k
YW1hZ2VfcmFuZ2UsIHN5cykgXA0KPj4gK8KgwqDCoCBfX0ZCX0dFTl9ERUZBVUxUX0RFRkVS
UkVEX09QU19EUkFXKF9fcHJlZml4LCBfX2RhbWFnZV9hcmVhLCBzeXMpDQo+PiArDQo+PiAr
LyoNCj4+ICsgKiBJbml0aWFsaXplcyBzdHJ1Y3QgZmJfb3BzIGZvciBkZWZlcnJlZCBJL08u
DQo+PiArICovDQo+PiArDQo+PiArI2RlZmluZSBfX0ZCX0RFRkFVTFRfREVGRVJSRURfT1BT
X1JEV1IoX19wcmVmaXgpIFwNCj4+ICvCoMKgwqAgLmZiX3JlYWTCoMKgwqAgPSBfX3ByZWZp
eCAjIyBfZGVmaW9fcmVhZCwgXA0KPj4gK8KgwqDCoCAuZmJfd3JpdGXCoMKgwqAgPSBfX3By
ZWZpeCAjIyBfZGVmaW9fd3JpdGUNCj4+ICsNCj4+ICsjZGVmaW5lIF9fRkJfREVGQVVMVF9E
RUZFUlJFRF9PUFNfRFJBVyhfX3ByZWZpeCkgXA0KPj4gK8KgwqDCoCAuZmJfZmlsbHJlY3TC
oMKgwqAgPSBfX3ByZWZpeCAjIyBfZGVmaW9fZmlsbHJlY3QsIFwNCj4+ICvCoMKgwqAgLmZi
X2NvcHlhcmVhwqDCoMKgID0gX19wcmVmaXggIyMgX2RlZmlvX2NvcHlhcmVhLCBcDQo+PiAr
wqDCoMKgIC5mYl9pbWFnZWJsaXTCoMKgwqAgPSBfX3ByZWZpeCAjIyBfZGVmaW9faW1hZ2Vi
bGl0DQo+PiArDQo+PiArI2RlZmluZSBfX0ZCX0RFRkFVTFRfREVGRVJSRURfT1BTX01NQVAo
X19wcmVmaXgpIFwNCj4+ICvCoMKgwqAgLmZiX21tYXDCoMKgwqAgPSBmYl9kZWZlcnJlZF9p
b19tbWFwDQo+PiArDQo+PiArI2RlZmluZSBGQl9ERUZBVUxUX0RFRkVSUkVEX09QUyhfX3By
ZWZpeCkgXA0KPj4gK8KgwqDCoCBfX0ZCX0RFRkFVTFRfREVGRVJSRURfT1BTX1JEV1IoX19w
cmVmaXgpLCBcDQo+PiArwqDCoMKgIF9fRkJfREVGQVVMVF9ERUZFUlJFRF9PUFNfRFJBVyhf
X3ByZWZpeCksIFwNCj4+ICvCoMKgwqAgX19GQl9ERUZBVUxUX0RFRkVSUkVEX09QU19NTUFQ
KF9fcHJlZml4KQ0KPj4gKw0KPj4gwqAgc3RhdGljIGlubGluZSBib29sIGZiX2JlX21hdGgo
c3RydWN0IGZiX2luZm8gKmluZm8pDQo+PiDCoCB7DQo+PiDCoCAjaWZkZWYgQ09ORklHX0ZC
X0ZPUkVJR05fRU5ESUFODQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjog
SXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------r6QVpEGW1WeVo3vErBpHD1G8--

--------------iQql70Vea1C4kMG6KF3BooR6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSJqhUFAwAAAAAACgkQlh/E3EQov+CH
jg//ThpLgmcmHvJWg4eHkgx4y448E2dcNHieCv3xpMAv0GMXrXTUZRZomrfToh+X+SPjS5ZCP+Pe
cTRNhPL7SohLPdmhV3Tp0ddikKnymp8ays+xsPPYHfvmbNPn0i2ElRDmepUqzwxXelH1iHJuTURw
gFhm0/gVRtxeJcHnTG8hN7ELNpNHPGaT/tQh7wYNPgTDleXGZQSNe3AA+Y6E1cmo2/kuppMzCJ/6
vCbq3b9LwUUd1lGJvVUk0t81AB6OFddR+whRivv5qKlLhRIjPM/IfE1lywFHXO6n3QUwj0NURjsy
T+lSOIynkpJNKIVd9D9krNwDPWCQdCyfV0zswtT8KnOqPsHQYFnvAsN1rMUwd50Nc6ednk0hCyAQ
OUMMPKCGKK0C0mMtnd7eA+0oXIttgvfFaaYxyKmFpmraK1BZhOpSPsIjrGrxekMaAwlxBEMPdmAR
/61jmBjx0nkt2J5G79pioWUHodaRzkeXA9ny4HDQnxzPrv1fLOW5S9i6K0fiIUvYoj252S7vBrAl
VMigqs74RL60aJ5Ema//+D/K48ZNSZ8tNTho5ZEQMFEHoCOEHhWOhU33/PbQfFxfiASyPbsEK3AY
EF3nOjYmQiyvj/hjJxQeAP5OxzpN6KSYKZtY24YYXs8/pCMq1hGgP2mDd4Ty1HskA2AiH2GMN1hg
/Hs=
=MIVD
-----END PGP SIGNATURE-----

--------------iQql70Vea1C4kMG6KF3BooR6--
