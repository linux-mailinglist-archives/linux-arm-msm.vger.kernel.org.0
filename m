Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45D1265FEF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 11:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjAFK27 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 05:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbjAFK2j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 05:28:39 -0500
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C036E424
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 02:26:38 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id D725A24E13;
        Fri,  6 Jan 2023 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1673000793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=h2SLcqpX6n1LKSYpgu5uFwrAixMVZlTubi+vsN3JlUk=;
        b=LaW/8KXzq9u1hsiaYG0BHBBN+Nwc8CVzk8pNXVox9sNQmDk3T4P1R7Fgdk3UZc3CTwIS8M
        8+dvoAUpTw/iJe/lmcm/3NNyu/CwgWPYSxXmmy117kseNGe2WbSxnJ/gJVyOOfQ5LTCQi7
        ogkw8eyJr9aBo5OTl3xhoJslsoKPfhk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1673000793;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=h2SLcqpX6n1LKSYpgu5uFwrAixMVZlTubi+vsN3JlUk=;
        b=+IgARq0NXaj9Yu0Whor2b6Qy2pj8Hg9w8v4k/JoHdZ2aaozvAz78h+1o+iTvQLf6aFaB65
        H43vJb4H5vpKkPDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A102D139D5;
        Fri,  6 Jan 2023 10:26:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id XNEUJln3t2NLBQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 10:26:33 +0000
Message-ID: <aba7322e-afb0-459b-d8d2-b596328b406d@suse.de>
Date:   Fri, 6 Jan 2023 11:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/fb-helper: Replace bpp/depth parameter by color
 mode
Content-Language: en-US
To:     daniel@ffwll.ch, mcanal@igalia.com, steev@kali.org,
        dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
        mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc:     dri-devel@lists.freedesktop.org,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
References: <20230106101643.31497-1-tzimmermann@suse.de>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230106101643.31497-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jnDcrDZSkS0By3Qp7ECAtaDf"
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jnDcrDZSkS0By3Qp7ECAtaDf
Content-Type: multipart/mixed; boundary="------------4rYSDTNcwCgJqvOwHnz0q5ua";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, mcanal@igalia.com, steev@kali.org,
 dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Message-ID: <aba7322e-afb0-459b-d8d2-b596328b406d@suse.de>
Subject: Re: [PATCH v3] drm/fb-helper: Replace bpp/depth parameter by color
 mode
References: <20230106101643.31497-1-tzimmermann@suse.de>
In-Reply-To: <20230106101643.31497-1-tzimmermann@suse.de>

--------------4rYSDTNcwCgJqvOwHnz0q5ua
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

Y2MnaW5nIGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnDQoNClN1cHBvc2VkIHRvIGZp
eCB0aGUgcmVjZW50IGNvbnNvbGUgaXNzdWVzLiBbMV0gUGxlYXNlIHRlc3QsIGlmIHBvc3Np
YmxlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9kcmktZGV2ZWwvWTdmajFONGJsbzJNWVpEdEBwaGVub20uZmZ3bGwubG9jYWwv
VC8jdA0KDQpBbSAwNi4wMS4yMyB1bSAxMToxNiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5u
Og0KPiBSZXBsYWNlIHRoZSBjb21iaW5hdGlvbiBvZiBicHAgYW5kIGRlcHRoIHdpdGggYSBz
aW5nbGUgY29sb3ItbW9kZQ0KPiBhcmd1bWVudC4gSGFuZGxlIHNwZWNpYWwgY2FzZXMgaW4g
c2ltcGxlZHJtIGFuZCBvZmRybS4gSGFyZC1jb2RlDQo+IFhSR0I4ODg4IGFzIGZhbGxiYWNr
IGZvcm1hdCBmb3IgY2FzZXMgd2hlcmUgbm8gZ2l2ZW4gZm9ybWF0IHdvcmtzLg0KPiANCj4g
VGhlIGNvbG9yLW1vZGUgYXJndW1lbnQgYWNjZXB0cyB0aGUgc2FtZSB2YWx1ZXMgYXMgdGhl
IGtlcm5lbCdzIHZpZGVvDQo+IHBhcmFtZXRlci4gVGhlc2UgYXJlIG1vc3RseSBicHAgdmFs
dWVzIGJldHdlZW4gMSBhbmQgMzIuIFRoZSBleGNlcHRpb25zDQo+IGFyZSAxNSwgd2hpY2gg
aGFzIGEgY29sb3IgZGVwdGggb2YgMTUgYW5kIGEgYnBwIHZhbHVlIG9mIDE2OyBhbmQgMzIs
DQo+IHdoaWNoIGhhcyBhIGNvbG9yIGRlcHRoIG9mIDI0IGFuZCBhIGJwcCB2YWx1ZSBvZiAz
Mi4NCj4gDQo+IHYzOg0KPiAJKiBmaXggb2Zkcm0gYnVpbGQgKE1heGltZSkNCj4gdjI6DQo+
IAkqIG1pbmltaXplIGNoYW5nZXMgKERhbmllbCkNCj4gCSogdXNlIGRybV9kcml2ZXJfbGVn
YWN5X2ZiX2Zvcm1hdCgpIChEYW5pZWwpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgfCAzOSArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMgICAgIHwgIDcgKysr
KystDQo+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAgNyArKysrKy0N
Cj4gICAzIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IGluZGV4IDEzNjljYTRhZTM5
Yi4uMmZlYjRiMGExNDc3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4g
QEAgLTE3NTYsMjQgKzE3NTYsMjEgQEAgc3RhdGljIHVpbnQzMl90IGRybV9mYl9oZWxwZXJf
ZmluZF9mb3JtYXQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwgY29uc3QNCj4g
ICAJcmV0dXJuIERSTV9GT1JNQVRfSU5WQUxJRDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMg
dWludDMyX3QgZHJtX2ZiX2hlbHBlcl9maW5kX2NtZGxpbmVfZm9ybWF0KHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpmYl9oZWxwZXIsDQo+IC0JCQkJCQkgIGNvbnN0IHVpbnQzMl90ICpmb3Jt
YXRzLCBzaXplX3QgZm9ybWF0X2NvdW50LA0KPiAtCQkJCQkJICBjb25zdCBzdHJ1Y3QgZHJt
X2NtZGxpbmVfbW9kZSAqY21kbGluZV9tb2RlKQ0KPiArc3RhdGljIHVpbnQzMl90IGRybV9m
Yl9oZWxwZXJfZmluZF9jb2xvcl9tb2RlX2Zvcm1hdChzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAq
ZmJfaGVscGVyLA0KPiArCQkJCQkJICAgICBjb25zdCB1aW50MzJfdCAqZm9ybWF0cywgc2l6
ZV90IGZvcm1hdF9jb3VudCwNCj4gKwkJCQkJCSAgICAgdW5zaWduZWQgaW50IGNvbG9yX21v
ZGUpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZmJfaGVscGVyLT5k
ZXY7DQo+ICAgCXVpbnQzMl90IGJwcCwgZGVwdGg7DQo+ICAgDQo+IC0JaWYgKCFjbWRsaW5l
X21vZGUtPmJwcF9zcGVjaWZpZWQpDQo+IC0JCXJldHVybiBEUk1fRk9STUFUX0lOVkFMSUQ7
DQo+IC0NCj4gLQlzd2l0Y2ggKGNtZGxpbmVfbW9kZS0+YnBwKSB7DQo+ICsJc3dpdGNoIChj
b2xvcl9tb2RlKSB7DQo+ICAgCWNhc2UgMToNCj4gICAJY2FzZSAyOg0KPiAgIAljYXNlIDQ6
DQo+ICAgCWNhc2UgODoNCj4gICAJY2FzZSAxNjoNCj4gICAJY2FzZSAyNDoNCj4gLQkJYnBw
ID0gZGVwdGggPSBjbWRsaW5lX21vZGUtPmJwcDsNCj4gKwkJYnBwID0gZGVwdGggPSBjb2xv
cl9tb2RlOw0KPiAgIAkJYnJlYWs7DQo+ICAgCWNhc2UgMTU6DQo+ICAgCQlicHAgPSAxNjsN
Cj4gQEAgLTE3ODQsNyArMTc4MSw3IEBAIHN0YXRpYyB1aW50MzJfdCBkcm1fZmJfaGVscGVy
X2ZpbmRfY21kbGluZV9mb3JtYXQoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlDQo+
ICAgCQlkZXB0aCA9IDI0Ow0KPiAgIAkJYnJlYWs7DQo+ICAgCWRlZmF1bHQ6DQo+IC0JCWRy
bV9pbmZvKGRldiwgInVuc3VwcG9ydGVkIGJwcCB2YWx1ZSBvZiAlZFxuIiwgY21kbGluZV9t
b2RlLT5icHApOw0KPiArCQlkcm1faW5mbyhkZXYsICJ1bnN1cHBvcnRlZCBjb2xvciBtb2Rl
IG9mICVkXG4iLCBjb2xvcl9tb2RlKTsNCj4gICAJCXJldHVybiBEUk1fRk9STUFUX0lOVkFM
SUQ7DQo+ICAgCX0NCj4gICANCj4gQEAgLTE4MTcsMTAgKzE4MTQsMTAgQEAgc3RhdGljIGlu
dCBfX2RybV9mYl9oZWxwZXJfZmluZF9zaXplcyhzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJf
aGVscGVyLCBpbnQgcHJlZmUNCj4gICAJCWRybV9jbGllbnRfZm9yX2VhY2hfY29ubmVjdG9y
X2l0ZXIoY29ubmVjdG9yLCAmY29ubl9pdGVyKSB7DQo+ICAgCQkJc3RydWN0IGRybV9jbWRs
aW5lX21vZGUgKmNtZGxpbmVfbW9kZSA9ICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZTsNCj4g
ICANCj4gLQkJCXN1cmZhY2VfZm9ybWF0ID0gZHJtX2ZiX2hlbHBlcl9maW5kX2NtZGxpbmVf
Zm9ybWF0KGZiX2hlbHBlciwNCj4gLQkJCQkJCQkJCSAgIHBsYW5lLT5mb3JtYXRfdHlwZXMs
DQo+IC0JCQkJCQkJCQkgICBwbGFuZS0+Zm9ybWF0X2NvdW50LA0KPiAtCQkJCQkJCQkJICAg
Y21kbGluZV9tb2RlKTsNCj4gKwkJCXN1cmZhY2VfZm9ybWF0ID0gZHJtX2ZiX2hlbHBlcl9m
aW5kX2NvbG9yX21vZGVfZm9ybWF0KGZiX2hlbHBlciwNCj4gKwkJCQkJCQkJCSAgICAgIHBs
YW5lLT5mb3JtYXRfdHlwZXMsDQo+ICsJCQkJCQkJCQkgICAgICBwbGFuZS0+Zm9ybWF0X2Nv
dW50LA0KPiArCQkJCQkJCQkJICAgICAgY21kbGluZV9tb2RlLT5icHApOw0KPiAgIAkJCWlm
IChzdXJmYWNlX2Zvcm1hdCAhPSBEUk1fRk9STUFUX0lOVkFMSUQpDQo+ICAgCQkJCWJyZWFr
OyAvKiBmb3VuZCBzdXBwb3J0ZWQgZm9ybWF0ICovDQo+ICAgCQl9DQo+IEBAIC0xODI5LDE3
ICsxODI2LDIzIEBAIHN0YXRpYyBpbnQgX19kcm1fZmJfaGVscGVyX2ZpbmRfc2l6ZXMoc3Ry
dWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwgaW50IHByZWZlDQo+ICAgCQlpZiAoc3Vy
ZmFjZV9mb3JtYXQgIT0gRFJNX0ZPUk1BVF9JTlZBTElEKQ0KPiAgIAkJCWJyZWFrOyAvKiBm
b3VuZCBzdXBwb3J0ZWQgZm9ybWF0ICovDQo+ICAgDQo+IC0JCS8qIHRyeSBwcmVmZXJyZWQg
YnBwL2RlcHRoICovDQo+IC0JCXN1cmZhY2VfZm9ybWF0ID0gZHJtX2ZiX2hlbHBlcl9maW5k
X2Zvcm1hdChmYl9oZWxwZXIsIHBsYW5lLT5mb3JtYXRfdHlwZXMsDQo+IC0JCQkJCQkJICAg
cGxhbmUtPmZvcm1hdF9jb3VudCwgcHJlZmVycmVkX2JwcCwNCj4gLQkJCQkJCQkgICBkZXYt
Pm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCk7DQo+ICsJCS8qIHRyeSBwcmVmZXJyZWQg
Y29sb3IgbW9kZSAqLw0KPiArCQlzdXJmYWNlX2Zvcm1hdCA9IGRybV9mYl9oZWxwZXJfZmlu
ZF9jb2xvcl9tb2RlX2Zvcm1hdChmYl9oZWxwZXIsDQo+ICsJCQkJCQkJCSAgICAgIHBsYW5l
LT5mb3JtYXRfdHlwZXMsDQo+ICsJCQkJCQkJCSAgICAgIHBsYW5lLT5mb3JtYXRfY291bnQs
DQo+ICsJCQkJCQkJCSAgICAgIHByZWZlcnJlZF9icHApOw0KPiAgIAkJaWYgKHN1cmZhY2Vf
Zm9ybWF0ICE9IERSTV9GT1JNQVRfSU5WQUxJRCkNCj4gICAJCQlicmVhazsgLyogZm91bmQg
c3VwcG9ydGVkIGZvcm1hdCAqLw0KPiAgIAl9DQo+ICAgDQo+ICAgCWlmIChzdXJmYWNlX2Zv
cm1hdCA9PSBEUk1fRk9STUFUX0lOVkFMSUQpIHsNCj4gKwkJLyoNCj4gKwkJICogSWYgbm9u
ZSBvZiB0aGUgZ2l2ZW4gY29sb3IgbW9kZXMgd29ya3MsIGZhbGwgYmFjaw0KPiArCQkgKiB0
byBYUkdCODg4OC4gRHJpdmVycyBhcmUgZXhwZWN0ZWQgdG8gcHJvdmlkZSB0aGlzDQo+ICsJ
CSAqIGZvcm1hdCBmb3IgY29tcGF0aWJpbGl0eSB3aXRoIGxlZ2FjeSBhcHBsaWNhdGlvbnMu
DQo+ICsJCSAqLw0KPiAgIAkJZHJtX3dhcm4oZGV2LCAiTm8gY29tcGF0aWJsZSBmb3JtYXQg
Zm91bmRcbiIpOw0KPiAtCQlyZXR1cm4gLUVBR0FJTjsNCj4gKwkJc3VyZmFjZV9mb3JtYXQg
PSBkcm1fZHJpdmVyX2xlZ2FjeV9mYl9mb3JtYXQoZGV2LCAzMiwgMjQpOw0KPiAgIAl9DQo+
ICAgDQo+ICAgCWluZm8gPSBkcm1fZm9ybWF0X2luZm8oc3VyZmFjZV9mb3JtYXQpOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS90aW55L29mZHJtLmMNCj4gaW5kZXggMzljNWZkNDYzZmVjLi42ZTM0OWNhNDI0ODUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYw0KPiBAQCAtMTM1Miw2ICsxMzUyLDcgQEAg
c3RhdGljIGludCBvZmRybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgIHsNCj4gICAJc3RydWN0IG9mZHJtX2RldmljZSAqb2RldjsNCj4gICAJc3RydWN0IGRy
bV9kZXZpY2UgKmRldjsNCj4gKwl1bnNpZ25lZCBpbnQgY29sb3JfbW9kZTsNCj4gICAJaW50
IHJldDsNCj4gICANCj4gICAJb2RldiA9IG9mZHJtX2RldmljZV9jcmVhdGUoJm9mZHJtX2Ry
aXZlciwgcGRldik7DQo+IEBAIC0xMzYzLDcgKzEzNjQsMTEgQEAgc3RhdGljIGludCBvZmRy
bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIAlpZiAocmV0KQ0K
PiAgIAkJcmV0dXJuIHJldDsNCj4gICANCj4gLQlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChk
ZXYsIGRybV9mb3JtYXRfaW5mb19icHAob2Rldi0+Zm9ybWF0LCAwKSk7DQo+ICsJY29sb3Jf
bW9kZSA9IGRybV9mb3JtYXRfaW5mb19icHAob2Rldi0+Zm9ybWF0LCAwKTsNCj4gKwlpZiAo
Y29sb3JfbW9kZSA9PSAxNikNCj4gKwkJY29sb3JfbW9kZSA9IG9kZXYtPmZvcm1hdC0+ZGVw
dGg7IC8vIGNhbiBiZSAxNSBvciAxNg0KPiArDQo+ICsJZHJtX2ZiZGV2X2dlbmVyaWNfc2V0
dXAoZGV2LCBjb2xvcl9tb2RlKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPiBpbmRleCA3MzU1NjE3ZjM4ZDMuLmY2NThi
OTljNzk2YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJt
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4gQEAgLTgw
Miw2ICs4MDIsNyBAQCBzdGF0aWMgaW50IHNpbXBsZWRybV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiAgIHsNCj4gICAJc3RydWN0IHNpbXBsZWRybV9kZXZpY2Ug
KnNkZXY7DQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7DQo+ICsJdW5zaWduZWQgaW50
IGNvbG9yX21vZGU7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICAgCXNkZXYgPSBzaW1wbGVk
cm1fZGV2aWNlX2NyZWF0ZSgmc2ltcGxlZHJtX2RyaXZlciwgcGRldik7DQo+IEBAIC04MTMs
NyArODE0LDExIEBAIHN0YXRpYyBpbnQgc2ltcGxlZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICAgCWlmIChyZXQpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAg
IA0KPiAtCWRybV9mYmRldl9nZW5lcmljX3NldHVwKGRldiwgZHJtX2Zvcm1hdF9pbmZvX2Jw
cChzZGV2LT5mb3JtYXQsIDApKTsNCj4gKwljb2xvcl9tb2RlID0gZHJtX2Zvcm1hdF9pbmZv
X2JwcChzZGV2LT5mb3JtYXQsIDApOw0KPiArCWlmIChjb2xvcl9tb2RlID09IDE2KQ0KPiAr
CQljb2xvcl9tb2RlID0gc2Rldi0+Zm9ybWF0LT5kZXB0aDsgLy8gY2FuIGJlIDE1IG9yIDE2
DQo+ICsNCj4gKwlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1cChkZXYsIGNvbG9yX21vZGUpOw0K
PiAgIA0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------4rYSDTNcwCgJqvOwHnz0q5ua--

--------------jnDcrDZSkS0By3Qp7ECAtaDf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO391kFAwAAAAAACgkQlh/E3EQov+Ad
Pw/8DjugvAaIdGga0txwxhLa0/hAsnHaRZB3mH2NyT8uD7r6op10zAkAq0CHOvbq/SNtFF+1brO5
VMGUd9vQbEOy47mCySyv3PRVlY1cxc7GXRa9gRcFgDb793kbT4CSBmASRknB/opOQ291iuJ95AZ5
X/4TMFE54l4ggOlZgAc98MDHC+WozDMz3vwQAw1onVifteBLbVZ4HVS7TWCxPkArwbWnUKN+Jb4U
MWW6MIycocZX+nDIIj6Jb3Ukw+SAY6s6rP4CiHUI4hoYvP5aKYG7GD5zg35uRs51UJm3vjbuTfKT
NofLB8h1DOVUKvKHkkz00ub49dQfTZtkiFljne8NmzHn5hGUuwr/hTQbNsS/4hCFj7agdZTdcBQP
8BMdyA4xWCgibWWLY8I/EP32VJ1/aGqjx2LdPMgyxZjOnlgHvxUiqPWDxjEbMBuzixXeMvzNPgIz
c0WDUpBlFsC24enHFE5MXOK+nqwLS03OQLe7C3MInV9hccMjGhpWvbodRd6pZU7+xxvcw3m7r0D0
bjvNmlSHsK8CzEMWkZfIOY5KA6dj9FlrMDBwZqLXIazOiq+MUMBrsZF2QjR3FNfLSl23IeCUXwmx
0PRCSvxpoqNsCVpMFKMDUKQy0kA6g3Jgh6NXh0SZRqwsJBslIsFBFaNh0DKBNKj1r4+tDdrOvShY
nms=
=/Sqv
-----END PGP SIGNATURE-----

--------------jnDcrDZSkS0By3Qp7ECAtaDf--
